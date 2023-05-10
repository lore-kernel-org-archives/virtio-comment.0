Return-Path: <virtio-comment-return-5861-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1FD2BC7EE22
	for <virtio-comment@archiver.kernel.org>; Wed, 10 May 2023 21:33:40 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 6F6554290B
	for <virtio-comment@archiver.kernel.org>; Wed, 10 May 2023 21:33:39 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 657C5986649
	for <virtio-comment@archiver.kernel.org>; Wed, 10 May 2023 21:33:39 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 5BF629865B0; Wed, 10 May 2023 21:33:39 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 42D0698631E
	for <virtio-comment@lists.oasis-open.org>; Wed, 10 May 2023 21:33:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-MC-Unique: 2ze1JODJP5q5O8tQa4V0YQ-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683754407; x=1686346407;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zHYeZvBW9jpQpfASRfTmDjnO7YsmxLm4WS36TcwZgls=;
        b=aSvWAmfImfsf1c/hLwbP9Z4vBkV6e4qigiAU+7t/RsWN4IFtz6DQ4ybf7b1EupyWZS
         rfSgXiuuc6tp+NFV4fLh0Y5IjfngDGnfP43Ezpf1FLcOstKhd60qTrbZQhdvv6rz0l4y
         LftcnPnEjuiekx/9dOG7up4Lysc6AD2XYJ23PCNxSqwA2OTWJDWrbiWzOwJD/6Wk87Kk
         3QfG9hoRZCLnYsgxO4gqnGD6Avp0l1KWZKohHsoJOiOTe9im1qi/1PsY+HOYEOzH3Jb4
         ss2CYL14EfBIE1DMITdTNz+odt3karAokOWBx5eiVOVLOCKfg1BpcWVPES1ssuhbyBs+
         pP9g==
X-Gm-Message-State: AC+VfDyKOIAMVlyfuVhpejgxO8vIs3vkFKRrzY/r42QZiY+lmYDMsdb6
	s8lFtxAupTZQrALl+9H8J2IDjmrZbE9DeC3vX/fdq/j/JN8gKQjLnE9cEB5C8ncwtoswWOLaBPz
	mAGytNvAMKjWB+uSEiMiRQ8O+uIwEuI8oWA==
X-Received: by 2002:a05:600c:231a:b0:3f1:789d:ad32 with SMTP id 26-20020a05600c231a00b003f1789dad32mr13368649wmo.11.1683754406807;
        Wed, 10 May 2023 14:33:26 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ5VqAaqw9XSGh7/LkGDPp+Swh5YE/UJvV0FrVSuDGgpQ42fPpHVJLoRie94ntSL+KFlcAL8Hg==
X-Received: by 2002:a05:600c:231a:b0:3f1:789d:ad32 with SMTP id 26-20020a05600c231a00b003f1789dad32mr13368634wmo.11.1683754406487;
        Wed, 10 May 2023 14:33:26 -0700 (PDT)
Date: Wed, 10 May 2023 17:33:21 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Parav Pandit <parav@nvidia.com>
Cc: Jason Wang <jasowang@redhat.com>,
	"virtio-dev@lists.oasis-open.org" <virtio-dev@lists.oasis-open.org>,
	"cohuck@redhat.com" <cohuck@redhat.com>,
	"david.edmondson@oracle.com" <david.edmondson@oracle.com>,
	"sburla@marvell.com" <sburla@marvell.com>,
	Yishai Hadas <yishaih@nvidia.com>, Maor Gottlieb <maorg@nvidia.com>,
	"virtio-comment@lists.oasis-open.org" <virtio-comment@lists.oasis-open.org>,
	Shahaf Shuler <shahafs@nvidia.com>
Message-ID: <20230510173301-mutt-send-email-mst@kernel.org>
References: <20230506000135.628899-1-parav@nvidia.com>
 <CACGkMEt_2B68a+BZ4-vfeDf_eYj5ZhxrDNd6dxuiF85qr0yN2g@mail.gmail.com>
 <20230507093959-mutt-send-email-mst@kernel.org>
 <CACGkMEtfMbcu2OPsH6P2tA1aHh2FKygv=xkJ-e1XQzb62nE1vQ@mail.gmail.com>
 <20230510014534-mutt-send-email-mst@kernel.org>
 <43ec1c8d-7d11-2400-3649-1fe366b1e21b@nvidia.com>
 <20230510121417-mutt-send-email-mst@kernel.org>
 <PH0PR12MB5481F030A76141320F03956EDC779@PH0PR12MB5481.namprd12.prod.outlook.com>
 <PH0PR12MB5481CEB307F413E53B03D502DC779@PH0PR12MB5481.namprd12.prod.outlook.com>
MIME-Version: 1.0
In-Reply-To: <PH0PR12MB5481CEB307F413E53B03D502DC779@PH0PR12MB5481.namprd12.prod.outlook.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Subject: [virtio-comment] Re: [PATCH v2 0/2] transport-pci: Introduce legacy registers access
 using AQ

On Wed, May 10, 2023 at 09:08:44PM +0000, Parav Pandit wrote:
> Hi Jason, Michel,
> 
> > From: virtio-comment@lists.oasis-open.org <virtio-comment@lists.oasis-
> > open.org> On Behalf Of Parav Pandit
> > Sent: Wednesday, May 10, 2023 1:34 PM
> > 
> > > From: Michael S. Tsirkin <mst@redhat.com>
> > > Sent: Wednesday, May 10, 2023 12:16 PM
> > >
> > > On Wed, May 10, 2023 at 12:11:50PM -0400, Parav Pandit wrote:
> > > >
> > > >
> > > > On 5/10/2023 2:04 AM, Michael S. Tsirkin wrote:
> > > > > On Mon, May 08, 2023 at 10:23:39AM +0800, Jason Wang wrote:
> > > > > > > I thought so too originally. Unfortunately I now think that
> > > > > > > no, legacy is not going to be a byproduct of transport
> > > > > > > virtqueue for modern - it is different enough that it needs dedicated
> > commands.
> > > > > >
> > > > > > If you mean the transport virtqueue, I think some dedicated
> > > > > > commands for legacy are needed. Then it would be a transport
> > > > > > that supports transitional devices. It would be much better than
> > > > > > having commands for a partial transport like this patch did.
> > > > >
> > > > > OK I am beginning to get what you are saying.  So your criticism
> > > > > is
> > > > > this: what if device supports vq transport for modern, and we want
> > > > > to build a transitional device on top.  how will that look. yes?
> > > > > A reasonable thing to include at least in the commit log. Parav?
> > > > >
> > > > I am still trying to understand what is "vq transport for modern"?
> > > > Do you mean transporting currently defined config space access over vq?
> > > > If so, is this VQ belong to the guest or hypervisor?
> > >
> > > https://lore.kernel.org/all/20220826100034.200432-2-
> > > lingshan.zhu%40intel.com/t.mbox.gz
> > 
> > The gz link is not accessible.
> > But I got the right link [1].
> > 
> > [1] https://lore.kernel.org/all/20220826100034.200432-2-
> > lingshan.zhu@intel.com/
> > 
> > 1. Above patch cover letter [1] is missing the basic objective/problem
> > statement.
> > i.e. why a transport virtqueue is needed?
> > But I probably get the idea of [1] as we did the AQ.
> > 
> > 2. Commit log says about
> > a. querying resource of management device (aka group owner in AQ now) b.
> > creating and destroying the managed device  (aka group owner creating group
> > member devices) c. configure the managed device (aka group owner
> > configuring/composing group member devices such as VFs, SFs, SIOV).
> > 
> > So, all above 2.a to 2.c belongs to the admin group owner and group
> > management commands like how it is defined in the AQ proposal.
> > 
> > So, 3 out of the 4 motivations are achieved by AQ proposal.
> > This AQ belongs to the hypervisor. I am clear on this part.
> > 
> > 4th point in cover letter is: "config virtqueues of the managed device".
> > 
> > This work belongs to the driver -> device direct communication using a queue
> > from driver to device.
> > So, I imagine this work can be done using a queue by the guest driver and
> > serviced by the device like how a guest driver configures the queue today
> > without any mediation.
> > For PCI, MMIO transport, surely this can be done by the PCI device directly
> > being is PF, VF or SIOV.
> > (Instead of config register, using a new queue interface). Looks fine to me.
> > 
> > Can this new cfg queue mediated like CVQ that is done in a sw? May be yes.
> > Should it be always mediated when it is of VF, SIOV Device? Mostly no because
> > it is yet another VQ for PF, VF, SIOV.
> > 
> > I am yet to parse rest of the 4 patches, please give me some time to review it.
> 
> I went over the past work of [1], [2].
> 
> [1] https://lore.kernel.org/all/20220826100034.200432-2-lingshan.zhu@intel.com/
> [2] https://lists.oasis-open.org/archives/virtio-comment/202208/msg00141.html
> 
> The "virtio q as transport" in [2] is bit misleading as its only role is to transport the _registers_ of the SIOV_R1 device through its parent PF.
> Rest of the work is the pure management work to manage the life cycle of SIOV devices (create/delete/configure/compose).
> 
> And the motivation is also clear is to provide composing a virtio device for the guest VM for the backward compatibility for 1.x part of the specification.
> 
> It seems fine and indeed orthogonal to me that: it is for backward compatibility for already defined config fields for existing guest VM driver.
> 
> It does not conflict with the cfgq/cmdq idea whose main purpose is for the new config fields, new use cases that doesn't require any mediation.
> Such cfgq works across PF, VF, SF/SIOV devices in uniform way without mediation.
> It also scales device register memory also very well in predictable way.
> 
> The registers and feature bits access described in [2], can certainly be done using new non_legacy new AQ commands.
> Both legacy and non-legacy command have different semantics as Michael mentioned.
> 
> The AQ semantics that Michael did as opposed to "virtqueue as transport" fits well for the use case described in [1].
> 
> There are changes on going in MSI-X area and SIOV, so you might want to wait for it.
> Or proposed command in [1] should be tagged as siov_r1, then things will be cleaner.
> 
> With that I don't see legacy 3 commands anyway conflict with [1].
> Some commands functionality is common between [1] and this proposal.
> But that's how the legacy is. It is confined to legacy emulation.
> So [1] can be done as follow_on to AQ and these series.
> 
> A small note about [2].
> virtio_transportq_ctrl_dev_attribute should be detached from CREATE call and split to two commands.
> So that VF and SF/SIOV can both utilize it. 
> SF/SIOV_R1 can use the creation and config part.
> VFs will use only the device features + config space.

I think some kind of "enable" command for VFs might have value. No?

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

