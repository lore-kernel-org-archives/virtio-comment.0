Return-Path: <virtio-comment-return-5367-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5CD6C7619A
	for <virtio-comment@archiver.kernel.org>; Tue, 11 Apr 2023 10:39:15 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id BD573EEA3D
	for <virtio-comment@archiver.kernel.org>; Tue, 11 Apr 2023 10:39:11 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 45494986760
	for <virtio-comment@archiver.kernel.org>; Tue, 11 Apr 2023 10:39:11 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 3372998673D; Tue, 11 Apr 2023 10:39:11 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 101369866AA
	for <virtio-comment@lists.oasis-open.org>; Tue, 11 Apr 2023 10:39:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-MC-Unique: 06HvYoa9OMqgj7O3jF5WPg-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1681209547;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=5YIxmBqL58+SO3E7hvwMRWRzfYi6wv71iIXLElk7l8c=;
        b=ho/OZuL4uE9DFY1b8nmKvDEZ6RiIWGMX0YkGrriCbVtE4U07gLbUyHHdtzse5nE97S
         u5aH18wtha2szHLnjCZncro+Qamsfs8kG06wc7DwH+x6ydcYQske13d2bSqsLJObsQ6o
         2cHUmGqkjFD+uMA9B9xKbU9bdPySUb5jT9pkCJYQPwoKGPu41EjOy/LvoJt5EKLnog5c
         e1TmGHRolrxkBv+vWVKZoFiY1InyAxNzn6QUl/C2xAu1CmwFzq8/pv0vXrKBK5VUMeCC
         Csw5YujVjJDo5NyrOILQ9dqmRz9abYWuQWFKGgDZ7NWJ4WqF9MwppHL131Y67tJGusNU
         cAdQ==
X-Gm-Message-State: AAQBX9fi53LwliLA7+yEUXBgl5Jo9VF1ammPZTUNVzpiGbLA3dwtRYgF
	O8hfcpw0nykTa8ghKV7T8Hxrxr4BVQdYB4cZnyXTxzbbJHKOhSd3j0Jmg0Hp5/WkfTZMOEYPy3r
	Y789W07sWvIbC7ueelVNzZkG9cbOoz+oa2w==
X-Received: by 2002:a5d:4742:0:b0:2ed:ed87:76ec with SMTP id o2-20020a5d4742000000b002eded8776ecmr1682458wrs.14.1681209547532;
        Tue, 11 Apr 2023 03:39:07 -0700 (PDT)
X-Google-Smtp-Source: AKy350aevr/YOLksWQamsGOhwJI2FbXM4hjGpLM5LuhgILBjonvEL/T55kv1kw2A5DWL6hapZ4n+Qw==
X-Received: by 2002:a5d:4742:0:b0:2ed:ed87:76ec with SMTP id o2-20020a5d4742000000b002eded8776ecmr1682441wrs.14.1681209547175;
        Tue, 11 Apr 2023 03:39:07 -0700 (PDT)
Date: Tue, 11 Apr 2023 06:39:03 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Yan Vugenfirer <yan@daynix.com>
Cc: Jason Wang <jasowang@redhat.com>, Parav Pandit <parav@nvidia.com>,
	virtio-dev@lists.oasis-open.org, cohuck@redhat.com,
	virtio-comment@lists.oasis-open.org, shahafs@nvidia.com,
	Satananda Burla <sburla@marvell.com>,
	Maxime Coquelin <maxime.coquelin@redhat.com>
Message-ID: <20230411063746-mutt-send-email-mst@kernel.org>
References: <CACGkMEtkOdwixxaRz2Pv9xP75vb13ncboX5XRs8NqFCUsS16aQ@mail.gmail.com>
 <20230410020906-mutt-send-email-mst@kernel.org>
 <CACGkMEtiROwuB+ECJqd13qdpMJSTMoDOzi1u_i85==42C0XSXw@mail.gmail.com>
 <20230410023715-mutt-send-email-mst@kernel.org>
 <CACGkMEs+E_OarQxP3NmLk3iSi7U0WgAn-m3b4eX7ULu1+v=sOw@mail.gmail.com>
 <20230410060417-mutt-send-email-mst@kernel.org>
 <CACGkMEuc47PdmQdC67Nz4AvX_+jy+XBgCkwZ1BHmM8VGb9gywA@mail.gmail.com>
 <20230411030056-mutt-send-email-mst@kernel.org>
 <CACGkMEt2QAfhCgpYjSRNzf3n4W_HJLrMfE9JHzocR_gPH_Zrtg@mail.gmail.com>
 <CALBs2cXURMEzCGnULicXbsBfwnKE5cZOz=M-_hhFCXZ=Lqb9Nw@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CALBs2cXURMEzCGnULicXbsBfwnKE5cZOz=M-_hhFCXZ=Lqb9Nw@mail.gmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Subject: Re: [virtio-comment] Re: [PATCH 09/11] transport-pci: Describe PCI
 MMR dev config registers

On Tue, Apr 11, 2023 at 12:19:14PM +0300, Yan Vugenfirer wrote:
> On Tue, Apr 11, 2023 at 12:02 PM Jason Wang <jasowang@redhat.com> wrote:
> >
> > On Tue, Apr 11, 2023 at 3:04 PM Michael S. Tsirkin <mst@redhat.com> wrote:
> > >
> > > On Tue, Apr 11, 2023 at 10:13:40AM +0800, Jason Wang wrote:
> > > > On Mon, Apr 10, 2023 at 6:06 PM Michael S. Tsirkin <mst@redhat.com> wrote:
> > > > >
> > > > > On Mon, Apr 10, 2023 at 03:20:52PM +0800, Jason Wang wrote:
> > > > > > On Mon, Apr 10, 2023 at 2:40 PM Michael S. Tsirkin <mst@redhat.com> wrote:
> > > > > > >
> > > > > > > On Mon, Apr 10, 2023 at 02:20:16PM +0800, Jason Wang wrote:
> > > > > > > > On Mon, Apr 10, 2023 at 2:15 PM Michael S. Tsirkin <mst@redhat.com> wrote:
> > > > > > > > >
> > > > > > > > > On Mon, Apr 10, 2023 at 09:33:32AM +0800, Jason Wang wrote:
> > > > > > > > > > This is fine for vDPA but not for virtio if the design can only work
> > > > > > > > > > for some specific setups (OSes/archs).
> > > > > > > > > >
> > > > > > > > > > Thanks
> > > > > > > > >
> > > > > > > > > Well virtio legacy has a long history of documenting existing hacks :)
> > > > > > > >
> > > > > > > > Exactly, so the legacy behaviour is not (or can't be) defined by the
> > > > > > > > spec but the codes.
> > > > > > >
> > > > > > > I mean driver behaviour derives from the code but we do document it in
> > > > > > > the spec to help people build devices.
> > > > > > >
> > > > > > >
> > > > > > > > > But yes, VIRTIO_F_ORDER_PLATFORM has to be documented.
> > > > > > > > > And we have to decide what to do about ACCESS_PLATFORM since
> > > > > > > > > there's a security problem if device allows not acking it.
> > > > > > > > > Two options:
> > > > > > > > > - relax the rules a bit and say device will assume ACCESS_PLATFORM
> > > > > > > > >   is acked anyway
> > > > > > > >
> > > > > > > > This will break legacy drivers which assume physical addresses.
> > > > > > >
> > > > > > > not that they are not already broken.
> > > > > >
> > > > > > I may miss something, the whole point is to allow legacy drivers to
> > > > > > run otherwise a modern device is sufficient?
> > > > >
> > > > > yes and if legacy drivers don't work in a given setup then we
> > > > > should not worry.
> > > > >
> > > > > > >
> > > > > > > > > - a new flag that is insecure (so useful for sec but useless for dpdk) but optional
> > > > > > > >
> > > > > > > > This looks like a new "hack" for the legacy hacks.
> > > > > > >
> > > > > > > it's not just for legacy.
> > > > > >
> > > > > > We have the ACCESS_PLATFORM feature bit, what is the useage for this new flag?
> > > > >
> > > > >
> > > > > ACCESS_PLATFORM is also a security boundary. so devices must fail
> > > > > negotiation if it's not there. this new one won't be.
> > > > >
> > > > >
> > > > > > >
> > > > > > > > And what about ORDER_PLATFORM, I don't think we can modify legacy drivers...
> > > > > > > >
> > > > > > > > Thanks
> > > > > > >
> > > > > > > You play some tricks with shadow VQ I guess.
> > > > > >
> > > > > > Do we really want to add a new feature in the virtio spec that can
> > > > > > only work with the datapath mediation?
> > > > > >
> > > > > > Thanks
> > > > >
> > > > > As long as a feature is useful and can't be supported otherwise
> > > > > we are out of options.
> > > >
> > > > Probably not? Is it as simple as relaxing this:
> > > >
> > > > "Transitional devices MUST expose the Legacy Interface in I/O space in BAR0."
> > > >
> > > > To allow memory space.
> > > >
> > > > This works for both software and hardware devices (I had a handy
> > > > hardware that supports legacy virtio drivers in this way).
> > > >
> > > > Thanks
> > >
> > > Yes it is certainly simpler.
> > >
> > > Question: what happens if you try to run existing windows guests or dpdk
> > > on these? Do they crash horribly or exit gracefully?
> >
> > Haven't tried DPDK and windows. But I remember DPDK supported legacy
> > MMIO bars for a while.
> 
> Regarding Windows drivers:
> 1. We are acking VIRTIO_F_ACCESS_PLATFORM in the driver. But, if you
> remember the "ATS" issue (Windows is either not detecting it or, even
> if detected, not using it) - then actually, we are not forcing Windows
> to remap the memory because Window fails to work with it correctly.
> 2. Current Windows drivers implementation doesn't support MMIO bars.
> We can enable the support if needed.
> 
> Best regards,
> Yan.

The question was about old legacy drivers, not modern ones.
What if they attach to a device and BAR0
is a memory not an IO bar?
Will they fail gracefully or crash?


> 
> >
> > Adding Maxime and Yan for comments here.
> >
> > >
> > > The point of the capability is to allow using modern device ID so such
> > > guests will not even try to bind.
> >
> > It means a mediation layer is required to use. Then it's not an issue
> > for this simple relaxing any more?
> >
> > An advantage of such relaxing is that, for the legacy drivers like an
> > ancient Linux version that can already do MMIO access to legacy BAR it
> > can work without any mediation.
> >
> > At least, if ID can help, it can be used with this as well.
> >
> > Thanks
> >
> >
> >
> > >
> > >
> > > > > Keeping field practice things out of the
> > > > > spec helps no one.
> > > > >
> > > > > > >
> > > > > > > --
> > > > > > > MST
> > > > > > >
> > > > >
> > >
> >


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

