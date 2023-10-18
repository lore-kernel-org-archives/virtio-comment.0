Return-Path: <virtio-comment-return-7775-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4B63CDB474
	for <virtio-comment@archiver.kernel.org>; Wed, 18 Oct 2023 01:56:41 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 0EEDF7DD65
	for <virtio-comment@archiver.kernel.org>; Wed, 18 Oct 2023 01:56:41 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id EF1FD98688B
	for <virtio-comment@archiver.kernel.org>; Wed, 18 Oct 2023 01:56:40 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id DC7A0986885; Wed, 18 Oct 2023 01:56:40 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id CAD1D986886
	for <virtio-comment@lists.oasis-open.org>; Wed, 18 Oct 2023 01:56:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-IronPort-AV: E=McAfee;i="6600,9927,10866"; a="450138548"
X-IronPort-AV: E=Sophos;i="6.03,233,1694761200"; 
   d="scan'208";a="450138548"
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10866"; a="791418365"
X-IronPort-AV: E=Sophos;i="6.03,233,1694761200"; 
   d="scan'208";a="791418365"
Message-ID: <216b7799-9449-4271-b50f-1faead34bd9d@intel.com>
Date: Wed, 18 Oct 2023 09:56:32 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Parav Pandit <parav@nvidia.com>, virtio-comment@lists.oasis-open.org,
 mst@redhat.com, cohuck@redhat.com
Cc: sburla@marvell.com, shahafs@nvidia.com, maorg@nvidia.com,
 yishaih@nvidia.com, jasowang@redhat.com
References: <20231017200645.779222-1-parav@nvidia.com>
Content-Language: en-US
From: "Zhu, Lingshan" <lingshan.zhu@intel.com>
In-Reply-To: <20231017200645.779222-1-parav@nvidia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [virtio-comment] [PATCH v2 0/8] Introduce device migration
 support commands



On 10/18/2023 4:06 AM, Parav Pandit wrote:
> This series introduces administration commands for member device migration
> for PCI transport; when needed it can be extended for other transports
> too.
>
> Use case requirements:
> ======================
> 1. A hypervisor system needs to provide a PCI VF as passthrough
>     device to the guest virtual machine and also support live
>     migration of this virtual machine.
>     A passthrough device has typically only PCI configuration space
>     and MSI-X table emulated. No virtio native interface offered
>     by the virtio member device is trapped and/or emulated.
> 2. A virtual machine may have one or more such passthrough
>     virtio devices.
> 3. A virtual machine may have other PCI passthrough device
>     which may also interact with virtio device.
> 4. A hypervisor runs a generic device type agnostic driver with
>     extension to support device migration.
> 5. A PCI VF passthrough device needs to support transparent
>     device reset and PCI FLR while the device migration is
>     ongoing.
> 6. A owner driver do not involve in device operations mediation
>     for the passthrough device at virtio interface level.
> 7. Mechanism is generic enough that applies to large family of
>     virtio devices and it does not involve trapping any virtio
>     device interfaces for the passthrough devices.
>
> Overview:
> =========
> Above usecase requirements is solved by PCI PF group owner driver
> facilitating the member device migration functionality using
> administration commands.
>
> There are three major functionalities.
>
> 1. Suspend and resume the device operation
> 2. Read and Write the device context containing all the information
>     that can be transferred from source to destination to migrate to
>     a member device
> 3. Track pages written by the device during device migration is
>     ongoing
>
> This comprehensive series introduces 4 infrastructure pieces
> covering PCI transport, peer to peer PCI devices, page write tracking
> (aka dirty page tracking) and generic virtio device context.
>
> 1. Device mode get,set (active, stop, freeze)
> 2. Device context read and write
> 3. Defines device context and compatibility command
> 4. Write reporting to track page addresses
>
> This series enables virtio PCI SR-IOV member device to member device
> migration. It can also be used to/from migrate from PCI SR-IOV member
> device to software composed PCI device if/when needed which can
> parse and compose software based PCI virtio device.
>
> Example flow:
> =============
> Source hypervisor:
> 1. Instructs device to start tracking pages it is writing
> 2. Periodically query the addresses of the written pages
> 3. Suspend the device operation
> 4. Read the device context and transfer to destination hypervisor
>
> Destination hypervisor:
> 5. Write the device context received from source
> 6. Resume the device that has newly written device context
>
> Patch summary:
> ==============
> patch-1: Adds theory of operation for device migration commands
> patch-2: Redefine reserved2 to command output field
> patch-3: Defines short device context for split virtqueues
> patch-4: Adds device migration commands
> patch-5: Adds requirements for device migration commands
> patch-6: Adds theory of operation for write reporting commands
> patch-7: Adds write reporting commands
> patch-8: Adds requirements for write reporting commands
>
> It also takes inspiration from the similar idea presented at KVM Forum
> at [1].
>
> Please review.
>
> Changelog:
> ==========
> v1->v2:
> - Addressed comments from Michael and Jason
> - replaced iova to page/physical address range in write recording commands
> - several device specific requirements added to clarify, interaction of
>    device reset, FLR, PCI PM and admin commands
> - added device context fields query command to learn compatibility
> - split device context field type range into generic and device specific
> - added device context extension section to maintain backward and future
>    compatibility
> - several rewording in theory of operation
> - added requirements to cover config space read/write interaction with
>    device context commands
> - added assumption about pci config space and msix table not present in
>    device context, which can be added when hypervisor need them
> v0->v1:
> - enrich device context to cover device configuration layout, feature bits
> - fixed alignment of device context fields
> - added missing Sign-off for the joint work done with Satananda
> - added link to the github issue
>
> [1] https://static.sched.com/hosted_files/kvmforum2022/3a/KVM22-Migratable-Vhost-vDPA.pdf
>
> Parav Pandit (8):
>    admin: Add theory of operation for device migration
>    admin: Redefine reserved2 as command specific output
>    device-context: Define the device context fields for device migration
>    admin: Add device migration admin commands
>    admin: Add requirements of device migration commands
>    admin: Add theory of operation for write recording commands
>    admin: Add write recording commands
>    admin: Add requirements of write reporting commands
>
>   admin-cmds-device-migration.tex | 641 ++++++++++++++++++++++++++++++++
>   admin.tex                       |  40 +-
>   content.tex                     |   1 +
>   device-context.tex              | 189 ++++++++++
>   4 files changed, 864 insertions(+), 7 deletions(-)
>   create mode 100644 admin-cmds-device-migration.tex
>   create mode 100644 device-context.tex
There were many discussions and questions on your V1 that did not 
receive effective answers from you.
We also didn't see these issues addressed in your V2. So, what's the 
purpose of releasing this V2?

Thanks


This publicly archived list offers a means to provide input to the
OASIS Virtual I/O Device (VIRTIO) TC.

In order to verify user consent to the Feedback License terms and
to minimize spam in the list archive, subscription is required
before posting.

Subscribe: virtio-comment-subscribe@lists.oasis-open.org
Unsubscribe: virtio-comment-unsubscribe@lists.oasis-open.org
List help: virtio-comment-help@lists.oasis-open.org
List archive: https://lists.oasis-open.org/archives/virtio-comment/
Feedback License: https://www.oasis-open.org/who/ipr/feedback_license.pdf
List Guidelines: https://www.oasis-open.org/policies-guidelines/mailing-lists
Committee: https://www.oasis-open.org/committees/virtio/
Join OASIS: https://www.oasis-open.org/join/

