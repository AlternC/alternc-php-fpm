# Every 5 minutes, do fpm actions
*/5 * * * *	   root		/usr/lib/alternc/sync-unix-accounts.php && /usr/lib/alternc/php7-fpm
