Return-Path: <virtio-comment-return-6107-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CFAE0C7EE29
	for <virtio-comment@archiver.kernel.org>; Sun,  4 Jun 2023 14:13:38 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 39B2429FD6
	for <virtio-comment@archiver.kernel.org>; Sun,  4 Jun 2023 14:13:38 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 2288998630A
	for <virtio-comment@archiver.kernel.org>; Sun,  4 Jun 2023 14:13:38 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 148CF9862DD; Sun,  4 Jun 2023 14:13:38 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 031239862E2
	for <virtio-comment@lists.oasis-open.org>; Sun,  4 Jun 2023 14:13:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-MC-Unique: vw_kK-B3Oo-xE67aJGaeSg-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685888015; x=1688480015;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dkJQEwgGHZpTEg9jAerr82oiaC0ycczi0w+XKZs0AmE=;
        b=i2ETxl+Meli9sPggjWwiUdvQDHmvyv2g4ahv8TbBjwXZKWwA3KQtclGMTfSzqbhYpl
         wgJ3cokDNDHY/hTWG7TIK0BV/d5I/Eulo7dLO9g4sOMy070XH2Lj9kBOZXAm4/G1AVM3
         tB70BvQ1Zf8/or3j6kdRftT4finmnc/NE0Edmox6wQXYi4ktPja0raImvh2GLqTHwfxc
         yQ8Qru9D1fHHOkUdIsb9fBNvTNSMjOxyKKN9AzXZ0QMEXRIc+aYmJHEKBk8xGh3XZVLj
         61m9r8fRsEnKqF8EImfubL8YXajiOvq92D7URHTJ3ujfBolqiOIo+3r8GJ4NWqdZzybc
         xOqA==
X-Gm-Message-State: AC+VfDyUppdFXOSr1ggXnU+FGOsaGHHlJ+PSBVxtKdWCLyT3YRaNlKqh
	iQ0Tnf3lHzQ60Rx1C85zV/79XAoDY2AeUdD7XeR2JLvtW+IALlJa0Dh6YiVw3+RD/qr7oFmIqss
	tWXv2hKAxcIWVmqnGSkBGSJn8XhBM4+GJlw==
X-Received: by 2002:adf:fb43:0:b0:30a:e954:3d9d with SMTP id c3-20020adffb43000000b0030ae9543d9dmr3271752wrs.29.1685888014993;
        Sun, 04 Jun 2023 07:13:34 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ54uailhw4vMuYSDkXM3r4/tq/UFvpjO/wlLfo/+BUYIY8fR2z2CPJG78idRhOiG2+d7yPuyA==
X-Received: by 2002:adf:fb43:0:b0:30a:e954:3d9d with SMTP id c3-20020adffb43000000b0030ae9543d9dmr3271734wrs.29.1685888014651;
        Sun, 04 Jun 2023 07:13:34 -0700 (PDT)
Date: Sun, 4 Jun 2023 10:13:30 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Parav Pandit <parav@nvidia.com>
Cc: "virtio-dev@lists.oasis-open.org" <virtio-dev@lists.oasis-open.org>,
	"cohuck@redhat.com" <cohuck@redhat.com>,
	"david.edmondson@oracle.com" <david.edmondson@oracle.com>,
	"sburla@marvell.com" <sburla@marvell.com>,
	"jasowang@redhat.com" <jasowang@redhat.com>,
	Yishai Hadas <yishaih@nvidia.com>, Maor Gottlieb <maorg@nvidia.com>,
	"virtio-comment@lists.oasis-open.org" <virtio-comment@lists.oasis-open.org>,
	Shahaf Shuler <shahafs@nvidia.com>
Message-ID: <20230604095615-mutt-send-email-mst@kernel.org>
References: <20230602203604.627661-1-parav@nvidia.com>
 <20230602203604.627661-3-parav@nvidia.com>
 <20230604091651-mutt-send-email-mst@kernel.org>
 <PH0PR12MB5481195B63FD61C35447FFDFDC4CA@PH0PR12MB5481.namprd12.prod.outlook.com>
MIME-Version: 1.0
In-Reply-To: <PH0PR12MB5481195B63FD61C35447FFDFDC4CA@PH0PR12MB5481.namprd12.prod.outlook.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Subject: [virtio-comment] Re: [PATCH v3 2/3] transport-pci: Introduce legacy registers access
 commands

On Sun, Jun 04, 2023 at 01:51:20PM +0000, Parav Pandit wrote:
> 
> > From: Michael S. Tsirkin <mst@redhat.com>
> > Sent: Sunday, June 4, 2023 9:22 AM
> 
> > > +The driver that may use the driver notifications region of the VF
> > > +device returned in this result likely attain higher performance or
> > > +the drier may use the VIRTIO_ADMIN_CMD_LREG_WRITE command.
> > 
> > Obtain I guess ... but how? There's no explanation.
> >
> Do you suggest to rewrite, above as below?
> 
> The driver that MAY use the driver notifications region of the VF likely obtain higher performance.
> The driver may use VIRTIO_ADMIN_CMD_LCC_REG_WRITE command for doorbell notifications.

No this does not address the issue that there is no description of how
this command is used just a hint at what it returns. So this gets us
some offset into some bar now what?  I am guessing writing vqn at this
offset into bar has the same effect as issuing
VIRTIO_ADMIN_CMD_LCC_REG_WRITE with offset 16 and data including the
vqn?


BTW all these may/must/should need to go into conformance section.

Generally the way we structure the spec is an explanation of
the theory of operation (mostly missing here)


> > > +\begin{note}
> > > +The PCI VF device should not use PCI BAR 0 when it prefers to support
> > > +legacy interface registers access using its group owner PF. This
> > > +enables hypervisor software to operate with least complexities to
> > > +compose a legacy interface I/O space BAR and passthrough other PCI
> > > +BARs and PCI device capabilities to the guest virtual machine without any
> > translation.
> > > +\end{note}
> > 
> > Is this related to this last command somehow? what does it mean for PCI VF
> > device to use a BAR? not use a BAR? Prefer what to what?
> 
> This is no different than v2, not sure why to discuss this in v3.

v2 had other issues so I missed this one.

> But ok.
> 
> No. It is not related to last command.
> What does a PCI Device use BAR for?

To reserve address space and know which addresses to claim.

Generally if I heard "not use BAR0" I would assume that the
meaning is that VF BAR0 in SRIOV expended capability
should be 0. However, that affects all VFs and not just
this VF so I don't really know what can it mean.

> As described in the spec, it uses the BAR in struct virtio_pci_cap for exposing various things.

Now I'm confused.
So do you mean the \field{bar} in virtio_pci_cap or PCI BAR?

> So it means that PCI VF should use other than PCI BAR 0 for various Virtio Structure PCI Capabilities that it exposes.

I suspect you then want to say "should not expose to driver
any structures inside it's BAR0"?
And does this include this new command you are adding or not?
It mentions bar too.  What about e.g. MSIX tables? Could there be other
capabilities referring to a BAR? How does hypervisor know
whether VF followed this rule (it's a should, not a hard rule after all)?


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

