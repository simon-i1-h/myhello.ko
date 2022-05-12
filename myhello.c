/* SPDX-License-Identifier: GPL-2.0-only */

#include <linux/kernel.h>
#include <linux/module.h>

static int __init myhello_init(void)
{
	printk(KERN_INFO "myhello: init");
	return 0;
}

static void __exit myhello_exit(void)
{
	printk(KERN_INFO "myhello: exit");
}

module_init(myhello_init);
module_exit(myhello_exit);
MODULE_LICENSE("GPL v2");
