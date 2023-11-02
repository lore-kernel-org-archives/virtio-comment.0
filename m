Return-Path: <virtio-comment-return-8133-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D369C0018A
	for <virtio-comment@archiver.kernel.org>; Thu,  2 Nov 2023 17:05:40 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 7A8712AC6B
	for <virtio-comment@archiver.kernel.org>; Thu,  2 Nov 2023 17:05:39 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 65976986C11
	for <virtio-comment@archiver.kernel.org>; Thu,  2 Nov 2023 17:05:39 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 50013986C0A; Thu,  2 Nov 2023 17:05:39 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id ABBB0986C0B
	for <virtio-comment@lists.oasis-open.org>; Thu,  2 Nov 2023 17:05:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-MC-Unique: -KqB0lhkNTub1vyPPTr0SA-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698944732; x=1699549532;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=VXz8oAS9et8vr5/ysffxEpk6lsMojBfT/MTKXmsAu+o=;
        b=ZDhf4y792NJvbTiuef/s4QOLXhqIwMZfDN3Hzw4OGTihAVvfY9hrs4ANrVmy9/VNZq
         h47cezmK29236XYYL8szvTHIsHzDy8v5U1IJv6oKb2rabvf0vD3QUUifDjwXUDJEM1YJ
         YBMSf/VeIhRTmpnMMOciLhN7czk5f04tCCoqFIAYbou/Ao7M217HmBytitUj9VBBjbEF
         9MuIH1dQv4oV5AvMDyk/uOjk8BN0WWq4asaiu5K/6CKxSH1pZHXpfcYmJe+ePedEp2Mg
         hz5UfF3GrAuq7roybILuIhytn5nDGDF1MCWl0B5ykuheZ/cTffkV4JwnVvkmHqJKU8WW
         17Fg==
X-Gm-Message-State: AOJu0Ywxs9Ck7dBYDzIDsJUrK3673pPxpz6xqrbt8BKwWhOt0uLKQDY0
	aJFe48UqyW86SWm50alnZw7FyaE76GgSikpHIBhKEHxa4srGza0qGC3uUVkwQSymPZ+2tKinmfN
	vTReag5lptmwJtCIWAnDVLlfo4ghjj1PS4Q==
X-Received: by 2002:a5d:690c:0:b0:32d:6031:2824 with SMTP id t12-20020a5d690c000000b0032d60312824mr14277741wru.24.1698944731994;
        Thu, 02 Nov 2023 10:05:31 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFGowMewvxFsDEGbrorjrtqNiXIxgzqxey3QuKqwEgITr+ngI9WtSVpaEWK5IpIF4Er4wG0cg==
X-Received: by 2002:a5d:690c:0:b0:32d:6031:2824 with SMTP id t12-20020a5d690c000000b0032d60312824mr14277724wru.24.1698944731622;
        Thu, 02 Nov 2023 10:05:31 -0700 (PDT)
Date: Thu, 2 Nov 2023 13:05:16 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Parav Pandit <parav@nvidia.com>
Cc: "virtio-comment@lists.oasis-open.org" <virtio-comment@lists.oasis-open.org>,
	"cohuck@redhat.com" <cohuck@redhat.com>,
	"sburla@marvell.com" <sburla@marvell.com>,
	Shahaf Shuler <shahafs@nvidia.com>,
	Maor Gottlieb <maorg@nvidia.com>, Yishai Hadas <yishaih@nvidia.com>
Message-ID: <20231102125927-mutt-send-email-mst@kernel.org>
References: <20231008112555.473895-1-parav@nvidia.com>
 <20231008112555.473895-4-parav@nvidia.com>
 <20231102101727-mutt-send-email-mst@kernel.org>
 <PH0PR12MB5481021BC87009ED7D8F5C6DDCA6A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <20231102104628-mutt-send-email-mst@kernel.org>
 <PH0PR12MB5481E02C73180D7E4C1DC624DCA6A@PH0PR12MB5481.namprd12.prod.outlook.com>
MIME-Version: 1.0
In-Reply-To: <PH0PR12MB5481E02C73180D7E4C1DC624DCA6A@PH0PR12MB5481.namprd12.prod.outlook.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Subject: [virtio-comment] Re: [PATCH v1 3/8] device-context: Define the device context fields
 for device migration

On Thu, Nov 02, 2023 at 03:06:49PM +0000, Parav Pandit wrote:
> 
> > From: Michael S. Tsirkin <mst@redhat.com>
> > Sent: Thursday, November 2, 2023 8:24 PM
> > 
> > On Thu, Nov 02, 2023 at 02:40:57PM +0000, Parav Pandit wrote:
> > > > From: Michael S. Tsirkin <mst@redhat.com>
> > > > Sent: Thursday, November 2, 2023 7:52 PM
> > > >
> > > > On Sun, Oct 08, 2023 at 02:25:50PM +0300, Parav Pandit wrote:
> > > > > +\begin{lstlisting}
> > > > > +struct virtio_dev_ctx_pci_vq_cfg {
> > > > > +        le16 vq_index;
> > > > > +        le16 queue_size;
> > > > > +        le16 queue_msix_vector;
> > > > > +        le64 queue_desc;
> > > > > +        le64 queue_driver;
> > > > > +        le64 queue_device;
> > > > > +};
> > > > > +\end{lstlisting}
> > > > > +
> > > > > +One or multiple entries of PCI Virtqueue Configuration Context
> > > > > +may exist, each such entry corresponds to a unique virtqueue
> > > > > +identified by the
> > > > \field{vq_index}.
> > > >
> > > > So consider this example. In practice it is quite possible that
> > > > driver is in the process of specifying e.g. queue_desc, and it set
> > > > queue_desc_hi but not queue_desc_lo. Then what is queue_desc?
> > > > Just a combination of a legal value of queue_desc_hi and illegal one
> > > > of queue_desc_lo? This makes no sense.
> > > > queue_desc is fundamentally undefined until queue is enabled.
> > >
> > > Sure, in next read of the device context the updated value will reflect.
> > > The destination will not work on this vq anyway as the device mode is freeze.
> > > The whole device context is not atomic, so having one field like this as
> > nonatomic similar to others is ok.
> > >
> > > In this example queue_enabled with the partial write should be still set to 0.
> > >
> > > >
> > > > This is why I suggest that we have records that match the transport.
> > > > Offset in structure can then we used as a tag and so we do not need
> > > > to come up with new definitions for each single thing.
> > > >
> > > If I understood you correctly, you prefer to transfer virtio config space as offset
> > and value as tag?
> > > If so, how tag helps if it still transfers partial value?
> > 
> > For example:
> > 
> > struct virtio_pci_common_cfg {
> >         /* About the whole device. */
> >         __le32 device_feature_select;   /* read-write */
> >         __le32 device_feature;          /* read-only */
> >         __le32 guest_feature_select;    /* read-write */
> >         __le32 guest_feature;           /* read-write */
> >         __le16 msix_config;             /* read-write */
> >         __le16 num_queues;              /* read-only */
> >         __u8 device_status;             /* read-write */
> >         __u8 config_generation;         /* read-only */
> > 
> >         /* About a specific virtqueue. */
> >         __le16 queue_select;            /* read-write */
> > 
> >         __le16 queue_size;              /* read-write, power of 2. */
> >         __le16 queue_msix_vector;       /* read-write */
> >         __le16 queue_enable;            /* read-write */
> >         __le16 queue_notify_off;        /* read-only */
> >         __le32 queue_desc_lo;           /* read-write */
> >         __le32 queue_desc_hi;           /* read-write */
> >         __le32 queue_avail_lo;          /* read-write */
> >         __le32 queue_avail_hi;          /* read-write */
> >         __le32 queue_used_lo;           /* read-write */
> >         __le32 queue_used_hi;           /* read-write */
> > };
> > 
> > We would have:
> >     tag: 32 (queue_desc_lo), len: 4
> >     tag: 34 (queue_desc_hi), len: 4
> > 
> So tag is offset. Ok.
> > 
> > The point is that the values programmed just map 1:1 to what is exposed in the
> > transport.
> > 
> For queue addresses, 
> > This means that the structure is different for different transports btw.
> > 
> > 
> > 
> > 
> > 
> > 
> > > > And, this is only an instance of the general principle: do not have
> > > > two definitions of the same thing. In fact I'd argue our transport
> > > > structures are an example of a bad design and the cost is that less
> > > > used ones like mmio and ccw sometimes lag behind on features.
> > >
> > > I totally agree on not duplicating it.
> > >
> > > For 64 VQs their content of struct virtio_dev_ctx_pci_vq_cfg is behind 8
> > registers.
> > > So for them there has contained in their own struct such as struct
> > virtio_dev_ctx_pci_vq_cfg, right?
> > >
> > > And current struct virtio_pci_common_cfg is giving the current snap shot of
> > register file.
> > >
> > > This is why there is some duplication.
> > > To avoid duplication of this registers, we will have to bisect each field of it and
> > omit these 3 address registers.
> > >
> > > Not able to see the gain of that overhead. Do you?
> > 
> > Not bisect. My idea is to just have each register in its own tag+length field. And
> > the gain is that we easily add fields without any pain and any duplication and
> > special documentation effort.
> We have to transport all the vq fields located behind the common config registers as struct anyway, isn’t it?
> And if we use tag for virtio common config space (instead of struct), why there won't be duplication? This is the part I still miss.

Not sure I understand the question.  The point is that when we add a new
field to common config we don't need to also add it to the migration
format - it has an offset and that automatically defines the format.

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

