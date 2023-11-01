Return-Path: <virtio-comment-return-8090-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2FF65C4332F
	for <virtio-comment@archiver.kernel.org>; Wed,  1 Nov 2023 08:29:06 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 6734B2AD64
	for <virtio-comment@archiver.kernel.org>; Wed,  1 Nov 2023 08:29:05 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 4A02E986BBF
	for <virtio-comment@archiver.kernel.org>; Wed,  1 Nov 2023 08:29:05 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 308B5986BB5; Wed,  1 Nov 2023 08:29:05 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 20089986BB6
	for <virtio-comment@lists.oasis-open.org>; Wed,  1 Nov 2023 08:29:05 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-MC-Unique: uWldFgscOwaqtwDPCJrrBg-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698827341; x=1699432141;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=o8n1wK7tki5wiRCw4MRE1tWdP0rBN3TZXKlJ272joN0=;
        b=Y01Nzcgf8UhELaYR4FSpc0i83n0t+WwSIzn3Io8glnTkAKNp7ZIGPjTYQenZ80FhFH
         vQ8vzHaudDpfostUYEZgwx07wgizyDop4imF/uXw/oyFsssvuVs7cKS46LQVqVJ6cMN8
         Ed7r0Go5/v2CgiRXe/6vTxCOu25pHxlH1flxWczfA+8+si1MEOtGA6sG28rBUPkIycV/
         E/QeRX6jpv50O0DGaShExPkhjU2BKdEaJs3miZhM6Zf6JGffx+CWKrkedd30iOowkij/
         UJmI+CNpI2GzwayOrVeafdXU13lavrOicplPk/4yA62rBFGZAO/ilpSihsP6LTmbShL0
         l0Vg==
X-Gm-Message-State: AOJu0Yz2YGEgOMfEKN/71d1DH9ufxLkueaX+W+kus3TD64yeIIdg3RWA
	Xgjo+dMwVnn7OtszM08ZLqF/1m3cMdG+3dhPnHCknVGd5qmlR878qze9ESmMmkVelwiaEvyd3w5
	gkdYYhB6ECB4PL54iiaBnnJkD9OGqyHF3kA==
X-Received: by 2002:aa7:c38b:0:b0:531:11fa:eacf with SMTP id k11-20020aa7c38b000000b0053111faeacfmr11462084edq.2.1698827341533;
        Wed, 01 Nov 2023 01:29:01 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFbZsFcsv+J8Uk2pJw7OsJsuatnNqzwk02elxZ+wKAXSiyGgNTQnJF59eDsIdFSNI9OxmymGg==
X-Received: by 2002:aa7:c38b:0:b0:531:11fa:eacf with SMTP id k11-20020aa7c38b000000b0053111faeacfmr11462064edq.2.1698827341204;
        Wed, 01 Nov 2023 01:29:01 -0700 (PDT)
Date: Wed, 1 Nov 2023 04:28:56 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Parav Pandit <parav@nvidia.com>
Cc: "Zhu, Lingshan" <lingshan.zhu@intel.com>,
	Jason Wang <jasowang@redhat.com>,
	"virtio-comment@lists.oasis-open.org" <virtio-comment@lists.oasis-open.org>,
	"cohuck@redhat.com" <cohuck@redhat.com>,
	"sburla@marvell.com" <sburla@marvell.com>,
	Shahaf Shuler <shahafs@nvidia.com>,
	Maor Gottlieb <maorg@nvidia.com>, Yishai Hadas <yishaih@nvidia.com>
Message-ID: <20231101041642-mutt-send-email-mst@kernel.org>
References: <PH0PR12MB548147B94D76EF02EF42A9B1DCA1A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <341b7a16-6927-412e-8a22-4841cd419314@intel.com>
 <PH0PR12MB54813BF8D0F6282A1932EF99DCA1A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <640cc639-6065-4828-ac81-0cc809aff293@intel.com>
 <20231031054617-mutt-send-email-mst@kernel.org>
 <DM8PR12MB54806512D1395AB39C59B821DCA7A@DM8PR12MB5480.namprd12.prod.outlook.com>
 <20231101012540-mutt-send-email-mst@kernel.org>
 <DM8PR12MB54802C006C5ADE546783E610DCA7A@DM8PR12MB5480.namprd12.prod.outlook.com>
 <20231101023257-mutt-send-email-mst@kernel.org>
 <PH0PR12MB548109F7EDDE8083DFE85167DCA7A@PH0PR12MB5481.namprd12.prod.outlook.com>
MIME-Version: 1.0
In-Reply-To: <PH0PR12MB548109F7EDDE8083DFE85167DCA7A@PH0PR12MB5481.namprd12.prod.outlook.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Subject: Re: [virtio-comment] Re: [PATCH v1 3/8] device-context: Define the
 device context fields for device migration

On Wed, Nov 01, 2023 at 06:47:57AM +0000, Parav Pandit wrote:
> 
> 
> > From: Michael S. Tsirkin <mst@redhat.com>
> > Sent: Wednesday, November 1, 2023 12:07 PM
> > 
> > On Wed, Nov 01, 2023 at 05:42:56AM +0000, Parav Pandit wrote:
> > >
> > > > From: Michael S. Tsirkin <mst@redhat.com>
> > > > Sent: Wednesday, November 1, 2023 11:01 AM
> > > >
> > > > On Wed, Nov 01, 2023 at 02:54:47AM +0000, Parav Pandit wrote:
> > > > >
> > > > >
> > > > > > From: Michael S. Tsirkin <mst@redhat.com>
> > > > > > Sent: Tuesday, October 31, 2023 3:44 PM
> > > > > >
> > > > > > On Tue, Oct 31, 2023 at 05:42:29PM +0800, Zhu, Lingshan wrote:
> > > > > > > > Your answer is not relevant to this discussion at all.
> > > > > > > > Why?
> > > > > > > > Because we were discussing the schemes where registers are not
> > used.
> > > > > > > > One example of that was IMS. It does not matter MSI or MSIX.
> > > > > > > > As explained in Intel's commit message, the key to focus for
> > > > > > > > IMS is "queue
> > > > > > memory" not some hw register like MSI or MSI-X.
> > > > > > > you know the device always need to know a address and the data
> > > > > > > to send a MSI, right?
> > > > > >
> > > > > > So if virtio is to use IMS then we'll need to add interfaces to
> > > > > > program IMS, I think. As part of that patch - it's reasonable to
> > > > > > assume - we will also need to add a way to retrieve IMS so it
> > > > > > can be
> > > > migrated.
> > > > > >
> > > > > > However, what this example demonstrates is that the approach
> > > > > > taken by this proposal to migrate control path structures -
> > > > > > namely, by defining a structure used just for migration - means
> > > > > > that we will need to come up with a migration interface each time.
> > > > > > And that is unfortunate.
> > > > > >
> > > > > When the device supports a new feature it has supported new
> > functionality.
> > > > > Hence the live migration side also got updated.
> > > > > However, the live migration driver does not have to understand
> > > > > what is inside
> > > > the control path structures.
> > > > > It is just byte stream.
> > > > > Only if the hypervisor live migration drive involved in emulating,
> > > > > it will parse
> > > > and that is fine as like other control structures.
> > > >
> > > > The point is that any new field needs to be added in two places now
> > > > and that is not great at all.
> > > >
> > > Most control structs are well defined. So only its type field is added to
> > migrating driver side.
> > > This is very low overhead field and handled in generic way for all device types
> > and for all common types.
> > 
> > Weird, not what I see.  E.g. you seem to have a structure duplicating queue
> > fields. Each new field will have to be added there in addition to the transport.
> > 
> Didn't follow.
> Which structure is duplicated?
> PCI does not even have a structure for q configuration.

So this:

+struct virtio_dev_ctx_pci_vq_cfg {
+        le16 vq_index;
+        le16 queue_size;
+        le16 queue_msix_vector;
+        le64 queue_desc;
+        le64 queue_driver;
+        le64 queue_device;
+};


duplicates a bunch of fields from this:

struct virtio_pci_common_cfg {
        /* About the whole device. */
        __le32 device_feature_select;   /* read-write */
        __le32 device_feature;          /* read-only */
        __le32 guest_feature_select;    /* read-write */
        __le32 guest_feature;           /* read-write */
        __le16 msix_config;             /* read-write */
        __le16 num_queues;              /* read-only */
        __u8 device_status;             /* read-write */
        __u8 config_generation;         /* read-only */

        /* About a specific virtqueue. */
        __le16 queue_select;            /* read-write */
        __le16 queue_size;              /* read-write, power of 2. */
        __le16 queue_msix_vector;       /* read-write */
        __le16 queue_enable;            /* read-write */
        __le16 queue_notify_off;        /* read-only */
        __le32 queue_desc_lo;           /* read-write */
        __le32 queue_desc_hi;           /* read-write */
        __le32 queue_avail_lo;          /* read-write */
        __le32 queue_avail_hi;          /* read-write */
        __le32 queue_used_lo;           /* read-write */
        __le32 queue_used_hi;           /* read-write */
};


Except it's incomplete and I suspect that's actually a bug.


Here's an idea: have a record per field. Use transport offsets
as tags.




> > > > We need a stronger compatiblity story here I think.
> > > >
> > > > One way to show how it's designed to work would be to split the
> > > > patches. For example, add queue notify data and queue reset separately.
> > > I didn't follow the suggestion. Can you explain splitting patches and its relation
> > to the structure?
> Did I miss your response? Or it is in below msix?

exactly.

> > >
> > > >
> > > > Another is to add MSIX table migration option for when MSIX table is
> > > > passed through to guest.
> > > Yes, this will be added in future when there is actual hypervisor for it.
> > 
> > You are tying the architecture to an extremely implementation specific detail.
> >
> Which part?
>  
> Not really. can you please which software will use MSI-X table migration?

Like, all and any? All hypervisors migrate the msi-x table.

> > Hypervisors *already* have migrate the MSIX table. Just in a hypervisor specific
> > way. 
> MSI-X table is in the PCI BAR memory.

Exactly. And that means hypervisor should not read it from the device
directly - e.g. with an encrypted device it won't be able to.

> > queue vector is an index into this table. So the index is migrated through
> > the device but the table itself has to be trapped and emulated by hypervisor?
> Do you have a hypervisor and a platform that has not done MSI-X table emulation for which you are asking to add?
> I don't know any.
> I am asking to add it when there is a _real_ user of it. Why it cannot be added when the _real_ user arrive?

Real meaning actual hardware and software implementing it?  By this
definition there's no real user for migration in the spec at all - all
of it can be done by device specific means. What's your point? By now we
have a reasonably good idea what hypervisors need to make migration
portable. Let's either put all of it in the spec or not bother at all.

In other words, we need a bright line. I suggest a simple one: memory is
migrated by device, config space by hypervisor.  If not, suggest another
one - but it needs a reasonable rule based on a hardware not whatever
software found expedient to use.


-- 
MST


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

