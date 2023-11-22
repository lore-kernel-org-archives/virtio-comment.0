Return-Path: <virtio-comment-return-8546-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B122BC61D9B
	for <virtio-comment@archiver.kernel.org>; Wed, 22 Nov 2023 10:05:37 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 296042A8E3
	for <virtio-comment@archiver.kernel.org>; Wed, 22 Nov 2023 10:05:36 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id A1F30986EB5
	for <virtio-comment@archiver.kernel.org>; Wed, 22 Nov 2023 10:05:35 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 1CD5998689C; Wed, 22 Nov 2023 10:05:35 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id B14A0986898
	for <virtio-comment@lists.oasis-open.org>; Wed, 22 Nov 2023 10:04:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-IronPort-AV: E=McAfee;i="6600,9927,10901"; a="478231335"
X-IronPort-AV: E=Sophos;i="6.04,218,1695711600"; 
   d="scan'208";a="478231335"
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10901"; a="1014184368"
X-IronPort-AV: E=Sophos;i="6.04,218,1695711600"; 
   d="scan'208";a="1014184368"
Message-ID: <6d60a6d4-f02b-4fd1-8981-f605552ee94e@intel.com>
Date: Wed, 22 Nov 2023 18:04:08 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Parav Pandit <parav@nvidia.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Jason Wang <jasowang@redhat.com>
Cc: "eperezma@redhat.com" <eperezma@redhat.com>,
 "cohuck@redhat.com" <cohuck@redhat.com>,
 "stefanha@redhat.com" <stefanha@redhat.com>,
 "virtio-comment@lists.oasis-open.org" <virtio-comment@lists.oasis-open.org>
References: <20231106044836-mutt-send-email-mst@kernel.org>
 <c6cb6e6b-fd2b-43ac-9be5-c4a8cda1ac13@intel.com>
 <20231108124625-mutt-send-email-mst@kernel.org>
 <b125da70-a769-4662-876b-43664e39c976@intel.com>
 <PH0PR12MB5481577C0492D45C20CF9C62DCAFA@PH0PR12MB5481.namprd12.prod.outlook.com>
 <CACGkMEvLYgnLtSqx_G=-KMuANEZ=xtAzJjV3pYqAZhA0qqW0sQ@mail.gmail.com>
 <PH0PR12MB54819A6E470D3ABE4BC1F450DCB1A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <CACGkMEtxm8M5vKfOPOAS347JAJNeRDyPe+nif1LszuRWS0vShQ@mail.gmail.com>
 <PH0PR12MB54810EF71D0BF925F4F81A65DCB0A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <CACGkMEtsMi9+MgDb=tTH=LrkReb3aZdB4wv-MJkxLmLhNmTDAg@mail.gmail.com>
 <20231121161218-mutt-send-email-mst@kernel.org>
 <7e440ddc-1765-406c-80b4-6a486ec2a232@intel.com>
 <PH0PR12MB548163E7EA30AFE2BAF7A937DCBAA@PH0PR12MB5481.namprd12.prod.outlook.com>
From: "Zhu, Lingshan" <lingshan.zhu@intel.com>
In-Reply-To: <PH0PR12MB548163E7EA30AFE2BAF7A937DCBAA@PH0PR12MB5481.namprd12.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [virtio-comment] RE: [PATCH V2 3/6] virtio: dont reset vqs when
 SUSPEND



On 11/22/2023 2:47 PM, Parav Pandit wrote:
>> From: Zhu, Lingshan <lingshan.zhu@intel.com>
>> Sent: Wednesday, November 22, 2023 7:22 AM
>>
>> On 11/22/2023 5:18 AM, Michael S. Tsirkin wrote:
>>> On Tue, Nov 21, 2023 at 03:33:07PM +0800, Jason Wang wrote:
>>>>> Lingshan claimed that suspending device is for live migration in commit log
>> and in discussion he portray it as some basic facility unrelated to device
>> migration such as debug etc.
>>>>> Instead of claiming it as some non_device_migration facility does not make
>> sense.
>>>> It is used for migration for sure.
>>> Well having a generic facility to stop device sounds like a nice thing.
>>> However the devil is in the detail. A lot of detail here seems very
>>> much tailored to a very specific implementation in mind.
>>> So thinking through how it will work e.g. for power management would
>>> be a good excercise to figure out how it should work in detail.
>>> Parav did you indicate at some point a virtio specific SUSPEND bit can
>>> be useful for PM? Could you share how it's better than transport level
>>> PM and what the requirements are?
>>> Thanks!
>> Do you mean letting the device enter a new power state when SUSPEND, and
>> such description in transport-pci.tex? Then resume normal state on
>> DRIVER_OK.
> My proposal is,
> 1. suspend bit (not state) to be controlled by the guest driver
The guest can set SUSPEND bit for sure. However there is no reason to
forbid host from setting SUSPEND.

The reason is, the live migration process should be transparent to the 
guest,
that means the guest should be suspended first, then the host suspend 
the device,
so no I/O errors in the guest.
> 2. this bit must be busy poll type. Meaning,
This is already in the patch, the driver should re-read to make sure the 
SUSPEND bit is set.
> a. the driver must get acknowledgement from the device that the suspend operation is completed in the device.
> b. the driver must get acknowledgement from the device that the resume operation is completed in the device.
Yes, by re-read, for example the device should only present SUSPEND bit 
in the device status when it finished
the process to suspend, already in the patch series.
>
> 3. Not to confuse this with administrative mode active/stop/freeze set by the owner device during device migration
>
> 4. This feature is usable in power management use case and may be some other.
Yes, as long as we use virtio status to control PM, rather than the reverse.


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

