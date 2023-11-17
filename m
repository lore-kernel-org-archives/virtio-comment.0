Return-Path: <virtio-comment-return-8434-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2CB6FC072A2
	for <virtio-comment@archiver.kernel.org>; Fri, 17 Nov 2023 10:08:34 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 7A950339BE
	for <virtio-comment@archiver.kernel.org>; Fri, 17 Nov 2023 10:08:33 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 59915986E22
	for <virtio-comment@archiver.kernel.org>; Fri, 17 Nov 2023 10:08:33 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 4233F986E1A; Fri, 17 Nov 2023 10:08:33 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 32102986E1B
	for <virtio-comment@lists.oasis-open.org>; Fri, 17 Nov 2023 10:08:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-MC-Unique: AWikdOhqO-iA7Bc_198Llg-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700215709; x=1700820509;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=mYaDvutTE9G7JwOmBcQ/8OUNYEQJvjexG/nEAcYeLiA=;
        b=D9Q/9gaVaYhYh2cyNN2Z2CRuTs3PrV6RZv7d/Z96tBV87cQqWocvBY8CCuLVDinBAl
         m9L/oUSAKCaRZBa35FX4OZ2jWIoakvtvC3YMwZEyrInHtQ/ZunJd2CnfYpf3XfYyYzDY
         4g4zsyXtIl4/angQi9gm5uAfNnuYzaOTma7HNDxENIHKO9w0OSErGlrnLhPMmcXy8/QM
         jdkHUXekOxb63bUZ6YIi/9ueI9eohODYE4aEuSDwcYwBdmyAAJGqzw8T9wROnRtFuO0F
         KIHl6N0hzN1ET0B/TIdv/avh/svyKVi4u6rmL1exwX57neHRs8C65eRTDVKk8toAUCGV
         y8Gg==
X-Gm-Message-State: AOJu0YzpX2xi6v7TyLY7xCWcaLWpgm4ButgCip2B0+NDOUJJ3B9k3LgR
	ompPiXtMNyBKoBSKrn48VdELJdY/atW9gTbdFgKxnk/MAuI6ged3TuqPEAXoM3tWHnxOzlu7/r0
	+51l+OyRM/e+x0WbLTYLoXN5pZBjb1bwHdQ==
X-Received: by 2002:a05:600c:3b1f:b0:406:3fda:962c with SMTP id m31-20020a05600c3b1f00b004063fda962cmr14526536wms.31.1700215709478;
        Fri, 17 Nov 2023 02:08:29 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHnA2AC//oCH/pDmzqEptrVDsdH74DLdbRp5gTaYzmzrf2JBDLwLxiUi/Gz1V4CnvKssw+Yfw==
X-Received: by 2002:a05:600c:3b1f:b0:406:3fda:962c with SMTP id m31-20020a05600c3b1f00b004063fda962cmr14526502wms.31.1700215708780;
        Fri, 17 Nov 2023 02:08:28 -0800 (PST)
Date: Fri, 17 Nov 2023 05:08:23 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Parav Pandit <parav@nvidia.com>
Cc: Jason Wang <jasowang@redhat.com>,
	"Zhu, Lingshan" <lingshan.zhu@intel.com>,
	"virtio-comment@lists.oasis-open.org" <virtio-comment@lists.oasis-open.org>,
	"cohuck@redhat.com" <cohuck@redhat.com>,
	"sburla@marvell.com" <sburla@marvell.com>,
	Shahaf Shuler <shahafs@nvidia.com>,
	Maor Gottlieb <maorg@nvidia.com>, Yishai Hadas <yishaih@nvidia.com>
Message-ID: <20231117050357-mutt-send-email-mst@kernel.org>
References: <CACGkMEu0gfw4zNc9KTLm9ekhuWgsgzHLVya_68HajQZObtr3-w@mail.gmail.com>
 <DM8PR12MB54808B71AA9C0A945D0A3226DCA7A@DM8PR12MB5480.namprd12.prod.outlook.com>
 <CACGkMEtKPPudHAXGbrOppwgRP=Umt-F0GNKeoajOGzgs+wvyLA@mail.gmail.com>
 <PH0PR12MB54815F58F470493FC516CDCCDCA6A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <CACGkMEsR56_C2b6-YQFpEOPt4sjJKyqcqrdhi9G0vU9ytezFLQ@mail.gmail.com>
 <PH0PR12MB54811373EA43BEDB4E159E0BDCAAA@PH0PR12MB5481.namprd12.prod.outlook.com>
 <CACGkMEsMzp7DjDkQcO4RZ0H0HfxSrytUJrSyDj6gnPWV9cTZow@mail.gmail.com>
 <DM8PR12MB548085F25849CF1E055826E6DCAFA@DM8PR12MB5480.namprd12.prod.outlook.com>
 <CACGkMEsfcEjue1UZmuNs8k65o3HSM94VsweSbWLH3383STR97A@mail.gmail.com>
 <PH0PR12MB548149E1E51DA9C1C094ABCADCB1A@PH0PR12MB5481.namprd12.prod.outlook.com>
MIME-Version: 1.0
In-Reply-To: <PH0PR12MB548149E1E51DA9C1C094ABCADCB1A@PH0PR12MB5481.namprd12.prod.outlook.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Subject: Re: [virtio-comment] [PATCH v1 1/8] admin: Add theory of operation
 for device migration

On Wed, Nov 15, 2023 at 05:39:43PM +0000, Parav Pandit wrote:
> > >
> > > Additionally, if hypervisor has put the trap on virtio config, and
> > > because the memory device already has the interface for virtio config,
> > >
> > > Hypervisor can directly write/read from the virtual config to the member's
> > config space, without going through the device context, right?
> > 
> > If it can do it or it can choose to not. I don't see how it is related to the
> > discussion here.
> >
> It is. I don’t see a point of hypervisor not using the native interface provided by the member device.

So for example, it seems reasonable to a member supporting both
existing pci register interface for compatibility and the future
DMA based one for scale. In such a case, it seems possible that
DMA will expose more features than pci. And then a hypervisor
might decide to use that in preference to pci registers.



>  > >
> > > >
> > > > >
> > > > > >
> > > > > > > it is not good idea to overload management commands with
> > > > > > > actual run time
> > > > > > guest commands.
> > > > > > > The device context read writes are largely for incremental updates.
> > > > > >
> > > > > > It doesn't matter if it is incremental or not but
> > > > > >
> > > > > It does because you want different functionality only for purpose
> > > > > of backward
> > > > compatibility.
> > > > > That also if the device does not offer them as portion of MMIO BAR.
> > > >
> > > > I don't see how it is related to the "incremental part".
> > > >
> > > > >
> > > > > > 1) the function is there
> > > > > > 2) hypervisor can use that function if they want and virtio
> > > > > > (spec) can't forbid that
> > > > > >
> > > > > It is not about forbidding or supporting.
> > > > > Its about what functionality to use for management plane and guest
> > plane.
> > > > > Both have different needs.
> > > >
> > > > People can have different views, there's nothing we can prevent a
> > > > hypervisor from using it as a transport as far as I can see.
> > > For device context write command, it can be used (or probably abused) to do
> > write but I fail to see why to use it.
> > 
> > The function is there, you can't prevent people from doing that.
> >
> One can always mess up itself. :)
> It is not prevented. It is just not right way to use the interface.
>  
> > > Because member device already has the interface to do config read/write and
> > it is accessible to the hypervisor.
> > 
> > Well, it looks self-contradictory again. Are you saying another set of commands
> > that is similar to device context is needed for non-PCI transport?
> >
> All these non pci transport discussion is just meaning less.
> Let MMIO bring the concept of member device at that point something make sense to discuss.
> PCI SIOV is also the PCI device at the end.
>  
> > >
> > > The read as_is using device context cannot be done because the caller is not
> > explicitly asking what to read.
> > > And the interface does not have it, because member device has it.
> > >
> > > So lets find the need if incremental bit is needed in the device_Context read
> > command or not or a bits to ask explicitly what to read optionally.
> > >
> > > >
> > > > >
> > > > > > >
> > > > > > > For VF driver it has own direct channel via its own BAR to
> > > > > > > talk to the
> > > > device.
> > > > > > So no need to transport via PF.
> > > > > > > For SIOV for backward compat vPCI composition, it may be needed.
> > > > > > > Hard to say, if that can be memory mapped as well on the BAR of the
> > PF.
> > > > > > > We have seen one device supporting it outside of the virtio.
> > > > > > > For scale anyway, one needs to use the device own cvq for
> > > > > > > complex
> > > > > > configuration.
> > > > > >
> > > > > > That's the idea but I meant your current proposal overlaps those
> > functions.
> > > > > >
> > > > > Not really. One can have simple virtio config space access
> > > > > read/write
> > > > functionality, in addition to what is done here.
> > > > > And that is still fine. One is doing proxying for guest.
> > > > > Management plane is doing more than just register proxy.
> > > >
> > > > See above, let's figure out whether it is possible as a transport first then.
> > > >
> > > Right. lets figure out.
> > >
> > > I would still promote to not mix management command with transport
> > command.
> > 
> > It's not a mixing, it's just because they are functional equivalents.
> > 
> It is not.
> I clarified the fundamental difference between the two.
> One is explicit read and write.
> Other is, return read data on change.
> For write, it is explicit set and it does not take effect until the mode is changed back to active.
> 
> > > Commands are cheap in nature. For transport if needed, they can be explicit
> > commands.
> > 
> > It will be a partial duplication of what is being proposed here.
> 
> There is always some overlap between management plane (hypervisor set/get) and control plane (guest driver get/set).
> > 
> > Thanks
> > 
> > 
> > 
> > >
> > > > >
> > > > > > >
> > > > > > > > >
> > > > > > > > > > > If for that is some admin commands are missing, may be
> > > > > > > > > > > one can add
> > > > > > > > them.
> > > > > > > > > >
> > > > > > > > > > I would then build the device context commands on top of
> > > > > > > > > > the transport commands/q, then it would be complete.
> > > > > > > > > >
> > > > > > > > > > > No need to step on toes of use cases as they are different...
> > > > > > > > > > >
> > > > > > > > > > > > I've shown you that
> > > > > > > > > > > >
> > > > > > > > > > > > 1) you can't easily say you can pass through all the
> > > > > > > > > > > > virtio facilities
> > > > > > > > > > > > 2) how ambiguous for terminology like "passthrough"
> > > > > > > > > > > >
> > > > > > > > > > > It is not, it is well defined in v3, v2.
> > > > > > > > > > > One can continue to argue and keep defining the
> > > > > > > > > > > variant and still call it data
> > > > > > > > > > path acceleration and then claim it as passthrough ...
> > > > > > > > > > > But I won't debate this anymore as its just
> > > > > > > > > > > non-technical aspects of least
> > > > > > > > > > interest.
> > > > > > > > > >
> > > > > > > > > > You use this terminology in the spec which is all about
> > > > > > > > > > technical, and you think how to define it is a matter of
> > > > > > > > > > non-technical. This is self-contradictory. If you fail,
> > > > > > > > > > it probably means it's
> > > > > > ambiguous.
> > > > > > > > > > Let's don't use that terminology.
> > > > > > > > > >
> > > > > > > > > What it means is described in theory of operation.
> > > > > > > > >
> > > > > > > > > > > We have technical tasks and more improved specs to
> > > > > > > > > > > update going
> > > > > > > > forward.
> > > > > > > > > >
> > > > > > > > > > It's a burden to do the synchronization.
> > > > > > > > > We have discussed this.
> > > > > > > > > In current proposed the member device is not bifurcated,
> > > > > > > >
> > > > > > > > It is. Part of the functions were carried via the PCI
> > > > > > > > interface, some are carried via owner. You end up with two
> > > > > > > > drivers to drive the
> > > > > > devices.
> > > > > > > >
> > > > > > > Nop.
> > > > > > > All admin work of device migration is carried out via the owner
> > device.
> > > > > > > All guest triggered work is carried out using VF itself.
> > > > > >
> > > > > > Guests don't (or can't) care about how the hypervisor is structured.
> > > > > For passthrough mode, it just cannot be structured inside the VF.
> > > >
> > > > Well, again, we are talking about different things.
> > > >
> > > > >
> > > > > > So we're discussing the view of device, member devices needs to
> > > > > > server for
> > > > > >
> > > > > > 1) request from the transport (it's guest in your context)
> > > > > > 2) request from the owner
> > > > >
> > > > > Doing #2 of the owner on the member device functionality do not
> > > > > work when
> > > > hypervisor do not have access to the member device.
> > > >
> > > > I don't get here, isn't 2) just what we invent for admin commands?
> > > > Driver sends commands to the owner, owner forward those requests to
> > > > the member?
> > > I am most with the term "driver" without notion of guest/hypervisor prefix.
> > >
> > > In one model,
> > > Member device does everything through its native interface = virtio config
> > and device space, cvq, data vqs etc.
> > > Here member device do not forward anything to its owner.
> > >
> > > The live migration hypervisor driver who has the knowledge of live migration
> > flow, accesses the owner device and get the side band member's information to
> > control it.
> > > So member driver do not forward anything here to owner driver.
> > >
> 


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

