Return-Path: <virtio-comment-return-8226-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42653C4332F
	for <virtio-comment@archiver.kernel.org>; Tue,  7 Nov 2023 08:23:02 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 9A7BD26A46
	for <virtio-comment@archiver.kernel.org>; Tue,  7 Nov 2023 08:23:01 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 881A5986B5C
	for <virtio-comment@archiver.kernel.org>; Tue,  7 Nov 2023 08:23:01 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 7D12F9867F0; Tue,  7 Nov 2023 08:23:01 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 6DD479867F1
	for <virtio-comment@lists.oasis-open.org>; Tue,  7 Nov 2023 08:23:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-MC-Unique: 4yZSx4B1MDWD_rmAOPD82Q-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699345378; x=1699950178;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cUoJx2nlkGcRls07lFfndZuDRkRhEp4Vb165DbyB/uo=;
        b=rhuvDJXbxy6A/waRIT5gMzzQYaFVESM7eMtHUgteT9KVLV4G3VmGJ0Wr7x6N+TpU2g
         UKbO2F3e3n2yihJbA3Q6uRs9ah284Bq5ASS8gztT2vBdYCYKNRZDlND9r2RZ2rT0VOKs
         FcNu4ym5VFuPkmaEVh9mjXlSIUURluUixmJddRx8akmH1XW+Zb6GJ7y/cCLS3BdNJRmr
         lHVR/D13XTTK6DxWvwf6g/IXChdElbHPSh5jOKKLePtw8Aw1FKwnbfx8rVU+0K5+IjIN
         7DHSKKq+uQedENJETaGgkc5wnBW0lcD1jep2/cHjnm4054fpVP17Taze/QWdIG2JNjq7
         WRXA==
X-Gm-Message-State: AOJu0Yz2TB6UDe0+GLDpiooPB6RvNIwcJSBk5pMuJ2k4y/uMRG0Wt/se
	X4hDLDPt6IeeX6w1e8mt425Z5aWs4/ZkHlI36iZXOw7Ymplz5koOjr6sBnGjaoFuVg7CYExFOv/
	XCLfnr6JrDlLerKvTajIxmLqTFDGfsCAoCg==
X-Received: by 2002:ac2:555b:0:b0:503:eae:4896 with SMTP id l27-20020ac2555b000000b005030eae4896mr21770765lfk.39.1699345377805;
        Tue, 07 Nov 2023 00:22:57 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGIWHvQlMLR1xTmbjxMfzIUd8j2iFao6pNEDsp9svW7FZEZtUANzAQvY+VqzfSbRMrycXMLWA==
X-Received: by 2002:ac2:555b:0:b0:503:eae:4896 with SMTP id l27-20020ac2555b000000b005030eae4896mr21770747lfk.39.1699345377382;
        Tue, 07 Nov 2023 00:22:57 -0800 (PST)
Date: Tue, 7 Nov 2023 03:22:53 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: "Zhu, Lingshan" <lingshan.zhu@intel.com>
Cc: jasowang@redhat.com, eperezma@redhat.com, cohuck@redhat.com,
	stefanha@redhat.com, virtio-comment@lists.oasis-open.org,
	parav@nvidia.com
Message-ID: <20231107031405-mutt-send-email-mst@kernel.org>
References: <20231103103437.72784-1-lingshan.zhu@intel.com>
 <20231103103437.72784-2-lingshan.zhu@intel.com>
 <20231103065138-mutt-send-email-mst@kernel.org>
 <d2f3c5cd-0376-460a-9230-4098863f1bb7@intel.com>
 <20231106042108-mutt-send-email-mst@kernel.org>
 <dfeba16d-8bfc-438a-8968-ab03d05cce75@intel.com>
 <20231106044347-mutt-send-email-mst@kernel.org>
 <8f3f0112-1ebb-4eda-ba92-46b9941e2e30@intel.com>
MIME-Version: 1.0
In-Reply-To: <8f3f0112-1ebb-4eda-ba92-46b9941e2e30@intel.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Subject: [virtio-comment] Re: [PATCH V2 1/6] virtio: introduce virtqueue state

On Tue, Nov 07, 2023 at 04:11:25PM +0800, Zhu, Lingshan wrote:
> 
> 
> On 11/6/2023 5:45 PM, Michael S. Tsirkin wrote:
> > On Mon, Nov 06, 2023 at 05:42:10PM +0800, Zhu, Lingshan wrote:
> > > 
> > > On 11/6/2023 5:35 PM, Michael S. Tsirkin wrote:
> > > > On Fri, Nov 03, 2023 at 10:49:42PM +0800, Zhu, Lingshan wrote:
> > > > >           +When SUSPEND is set, the device MUST record the Available State of every enabled splited virtqueue
> > > > >           +in \field{Available State} field,
> > > > >           +and correspondingly restore the Available State of every enabled splited virtqueue
> > > > >           +from \field{Available State} field when DRIVER_OK is set.
> > > > >           +
> > > > >           +The device SHOULD reset \field{Available State} field upon a device reset.
> > > > > 
> > > > >       At this point I have no idea
> > > > >       - how can a state of a virtqueue at a random time be represented
> > > > >         by a 16 bit integer
> > > > > 
> > > > > not sure what is a random time, this is to request the device to reset
> > > > > its avail state, for example, it is "le16 queue_avail_state" in virtio-pci
> > > > > common cfg. Resetting this so the device will not recover from a wrong value of
> > > > > the last run.
> > > > You simply never bother to say what is "Available State" and what
> > > > does it mean to restore it.  Not to mention words like "splited"
> > > > which just adds to the confusion.
> > > It says:
> > > +The available state field is two bytes of virtqueue state that is used by
> > > +the device to read the next available buffer. It is presented in the
> > > following format:
> > > 
> > > Do you want me to add more descriptions?
> > maybe start with an example
> I think they are already in the spec, I can add:
> see also "2.7.6 The Virtqueue Available Ring" and "2.7.13.1 Placing Buffers
> Into The Descriptor Table"
> > 
> > > > >       - if it's not at a random time then why do you even need an integer -
> > > > >         synchronize queue to memory and then all state is in memory
> > > > > 
> > > > > Not sure what is a sync queue, but for example, "le16 queue_avail_state" for
> > > > > PCI transport exists in a cap.
> > > > I just point out that normally a lot of ring state is in memory.
> > > > So you need to be much more specific about how you are augmenting that.
> > > > For example, if buffers are used exactly in order for a split ring
> > > > then used index seems to be exactly the same as last available index
> > > > you describe - it's a free running counter. OTOH if they are not
> > > > used in order then I don't see how is a single index sufficient to
> > > > describe which ones have been used and which not.
> > > I am not sure I get it.
> > > 
> > > Used idx(not like packed vq, no over-writing descriptors) and other states
> > > are in guest memory, so migrated with guest migration.
> > yes and so? why is that not enough and what is this available state then?
> The spec has illustrated how available index work and has given an
> example(see above cited sections)
> And this patch even has given a more clear description for it.
> 
> Other states are in guest memory and migrated with guest memory.

Yea I wrote large parts of it and I know how the available index works.

And sorry no idea what you are talking about.

At any time, there can be up to 2^16 buffers that have been made
available, and a random subset of these have been used. There is no
chance in the world a single 16 bit index describes even that part of
state, never mind device type specific processing that might be going
on.

As a wild guest this proposal is making a bunch of unstated assumptions
about device being in a very specific state where this *is* possible.
For people to be able to implement devices and drivers these
need to be spelled out.


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

