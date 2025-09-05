#include <stdio.h>
#include <stdlib.h>
#include <syslog.h>

int main(int argc, char *argv[])
{
    /* Open logging connection */
    openlog("writer", LOG_PID | LOG_CONS,
            LOG_USER); /* Open the logging connection */

    /* Verify that exactly two arguments were given */
    if (argc != 3) {
        syslog(LOG_ERR, "Error: Two arguments required.");
        syslog(LOG_ERR, "Usage: %s <writefile> <writestr>", argv[0]);
        closelog();
        return 1;
    }

    /* Initialize arguments */
    const char *writefile = argv[1];
    const char *writestr = argv[2];

    /* Open file stream */
    FILE *fs = fopen(writefile, "w");

    if (!fs) {
        syslog(LOG_ERR, "Failed to open the file.");
        closelog();
        return 1;
    }

    /* Write string to file */
    fputs(writestr, fs);

    /* Log write operation */
    syslog(LOG_DEBUG, "Writing %s to %s", writestr, writefile);

    fclose(fs);
    closelog();
    return 0;
}
