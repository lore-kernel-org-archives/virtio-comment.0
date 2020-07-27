Return-Path: virtio-comment-return-1373-cohuck=redhat.com@lists.oasis-open.org
Sender: <virtio-comment@lists.oasis-open.org>
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 9571B985B4C
	for <virtio-comment@lists.oasis-open.org>; Mon, 27 Jul 2020 13:56:47 +0000 (UTC)
Date: Mon, 27 Jul 2020 09:56:39 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
Message-ID: <20200727095239-mutt-send-email-mst@kernel.org>
References: <f109fe5a-92eb-e5a5-bb83-ada42b3a9b61@siemens.com>
 <20200727091802-mutt-send-email-mst@kernel.org>
 <85f69f31-e4c6-e7af-1fa5-90e5a2c81ae8@siemens.com>
MIME-Version: 1.0
In-Reply-To: <85f69f31-e4c6-e7af-1fa5-90e5a2c81ae8@siemens.com>
Subject: Re: [virtio-comment] Re: [RFC] ivshmem v2: Shared memory device
 specification
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
To: Jan Kiszka <jan.kiszka@siemens.com>
Cc: "virtio-comment@lists.oasis-open.org" <virtio-comment@lists.oasis-open.org>, Jailhouse <jailhouse-dev@googlegroups.com>, qemu-devel <qemu-devel@nongnu.org>, Alex =?iso-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>, liang yan <lyan@suse.com>
List-ID: <virtio-comment.lists.oasis-open.org>

On Mon, Jul 27, 2020 at 03:39:32PM +0200, Jan Kiszka wrote:
> On 27.07.20 15:20, Michael S. Tsirkin wrote:
> > On Mon, May 25, 2020 at 09:58:28AM +0200, Jan Kiszka wrote:
> > > #### Vendor Specific Capability (ID 09h)
> > > 
> > > This capability must always be present.
> > > 
> > > | Offset | Register            | Content                                        |
> > > |-------:|:--------------------|:-----------------------------------------------|
> > > |    00h | ID                  | 09h                                            |
> > > |    01h | Next Capability     | Pointer to next capability or 00h              |
> > > |    02h | Length              | 20h if Base Address is present, 18h otherwise  |
> > > |    03h | Privileged Control  | Bit 0 (read/write): one-shot interrupt mode    |
> > > |        |                     | Bits 1-7: Reserved (0 on read, writes ignored) |
> > > |    04h | State Table Size    | 32-bit size of read-only State Table           |
> > > |    08h | R/W Section Size    | 64-bit size of common read/write section       |
> > > |    10h | Output Section Size | 64-bit size of output sections                 |
> > > |    18h | Base Address        | optional: 64-bit base address of shared memory |
> > > 
> > > All registers are read-only. Writes are ignored, except to bit 0 of
> > > the Privileged Control register.
> > 
> > 
> > Is there value in making this follow the virtio vendor-specific
> > capability format? That will cost several extra bytes - do you envision
> > having many of these in the config space?
> 
> Of course, this could be modeled with via virtio_pci_cap as well. Would add
> 12 unused by bytes and one type byte. If it helps to make the device look
> more virtio'ish, but I'm afraid there are more differences at PCI level.

I guess it will be useful if we ever find it handy to make an ivshmem
device also be a virtio device. Can't say why yet but if we don't care
it vaguely seems kind of like a good idea. I guess it will also be handy
if you ever need another vendor specific cap: you already get a way to
identify it without breaking drivers.


> I do not see a use case for having multiple of those caps above per device.
> If someone comes around with a valid use case for having multiple,
> non-consequitive shared memory regions for one device, we would need to add
> registers for them. But that would also only work for non-BAR regions due to
> limited BARs.


OK, I guess this answers the below too.

> > Also, do we want to define an extended capability format in case this
> > is a pci extended capability?
> > 
> 
> What would be the practical benefit? Do you see PCIe caps that could become
> useful in virtual setups?

So if we ever have a huge number of these caps, PCIe allows many more
caps.

> We don't do that for regular virtio devices
> either, do we?

We don't, there's a small number of these so we don't run out of config
space.

> 
> Thanks,
> Jan
> 
> -- 
> Siemens AG, Corporate Technology, CT RDA IOT SES-DE
> Corporate Competence Center Embedded Linux


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

