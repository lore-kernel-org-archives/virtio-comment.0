Return-Path: <virtio-comment-return-5833-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9052C77B7D
	for <virtio-comment@archiver.kernel.org>; Sun,  7 May 2023 13:44:24 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id B9B502AF8B
	for <virtio-comment@archiver.kernel.org>; Sun,  7 May 2023 13:44:23 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id A13DE983F7C
	for <virtio-comment@archiver.kernel.org>; Sun,  7 May 2023 13:44:23 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 8CA1F983E8F; Sun,  7 May 2023 13:44:23 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 78C02983E91
	for <virtio-comment@lists.oasis-open.org>; Sun,  7 May 2023 13:44:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-MC-Unique: Fx0iVj4iN2CnRfSlRXdEjA-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683467060; x=1686059060;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Q7aT0io9eI1tQm0UG7iE9/iqSX8MgGFX1tc8CK9e+6U=;
        b=j55n+Vntl79EWs4d5m4xm8z+mOTlSiorViDiWbx0ZbaRIiBAxTUBi6Llj6TUY8Fa7S
         bdge7h4DcfPt7yfILgqabeDujoEfh27hGeByYLv4aytyOhgSJbvVmglOFU0eJYmHxroV
         hfVos9f6cWRl+l8snVlpKpNoC7fSmYJadJDzRv/fBAk73+ReIlGfPOyLMalZ+pBZ42cs
         a4Z5vrQ00R8mFw2bqlrNXBaOyXfRa3FpK5ECoI6FfJgwDtKSTCwnFndol5NJ6NP+D4qU
         011VEzytAJxmGXhe/zt/tGVU9lYwSbrxfQYk05UPeOsFgKWq3BpZC/recXgbgPMUcHcS
         6dyQ==
X-Gm-Message-State: AC+VfDzPH/el7eFdljVP8T1XkB+aORdOLJJnGz1z9/7LoXBrtv2Eq/DU
	Y6BW265GmCrCqy6fiYkUFsD+KtEqNFL8UrDzkzOH/PicwnJL8A0NoIr92g+LbL3emyFJxx7HSDQ
	hyv3pmmPZZZa8DIhcXJLBoNhAGVSi/XUnfw==
X-Received: by 2002:a1c:4b19:0:b0:3f1:78d0:fc4e with SMTP id y25-20020a1c4b19000000b003f178d0fc4emr4972516wma.32.1683467059953;
        Sun, 07 May 2023 06:44:19 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ5wK2BJtztINfRqcS7338c2Qw3rSQk7Iy/G1VuxUXEmhcHTxeMJwQIiHfh7eW0ceXSbXbRP8Q==
X-Received: by 2002:a1c:4b19:0:b0:3f1:78d0:fc4e with SMTP id y25-20020a1c4b19000000b003f178d0fc4emr4972504wma.32.1683467059596;
        Sun, 07 May 2023 06:44:19 -0700 (PDT)
Date: Sun, 7 May 2023 09:44:14 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Jason Wang <jasowang@redhat.com>
Cc: Parav Pandit <parav@nvidia.com>, virtio-dev@lists.oasis-open.org,
	cohuck@redhat.com, david.edmondson@oracle.com, sburla@marvell.com,
	yishaih@nvidia.com, maorg@nvidia.com,
	virtio-comment@lists.oasis-open.org, shahafs@nvidia.com
Message-ID: <20230507093959-mutt-send-email-mst@kernel.org>
References: <20230506000135.628899-1-parav@nvidia.com>
 <CACGkMEt_2B68a+BZ4-vfeDf_eYj5ZhxrDNd6dxuiF85qr0yN2g@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CACGkMEt_2B68a+BZ4-vfeDf_eYj5ZhxrDNd6dxuiF85qr0yN2g@mail.gmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Subject: [virtio-comment] Re: [PATCH v2 0/2] transport-pci: Introduce legacy registers access
 using AQ

On Sat, May 06, 2023 at 10:31:30AM +0800, Jason Wang wrote:
> On Sat, May 6, 2023 at 8:02 AM Parav Pandit <parav@nvidia.com> wrote:
> >
> > This short series introduces legacy registers access commands for the owner
> > group member PCI PF to access the legacy registers of the member VFs.
> >
> > If in future any SIOV devices to support legacy registers, they
> > can be easily supported using same commands by using the group
> > member identifiers of the future SIOV devices.
> >
> > More details as overview, motivation, use case are further described
> > below.
> >
> > Patch summary:
> > --------------
> > patch-1 adds administrative virtuqueue commands
> > patch-2 adds its conformance section
> >
> > This short series is on top of latest work [1] from Michael.
> > It uses the newly introduced administrative virtqueue facility with 3 new
> > commands which uses the existing virtio_admin_cmd.
> >
> > [1] https://lists.oasis-open.org/archives/virtio-comment/202305/msg00112.html
> >
> > Usecase:
> > --------
> > 1. A hypervisor/system needs to provide transitional
> >    virtio devices to the guest VM at scale of thousands,
> >    typically, one to eight devices per VM.
> >
> > 2. A hypervisor/system needs to provide such devices using a
> >    vendor agnostic driver in the hypervisor system.
> >
> > 3. A hypervisor system prefers to have single stack regardless of
> >    virtio device type (net/blk) and be future compatible with a
> >    single vfio stack using SR-IOV or other scalable device
> >    virtualization technology to map PCI devices to the guest VM.
> >    (as transitional or otherwise)
> >
> > Motivation/Background:
> > ----------------------
> > The existing virtio transitional PCI device is missing support for
> > PCI SR-IOV based devices. Currently it does not work beyond
> > PCI PF, or as software emulated device in reality. Currently it
> > has below cited system level limitations:
> >
> > [a] PCIe spec citation:
> > VFs do not support I/O Space and thus VF BARs shall not indicate I/O Space.
> >
> > [b] cpu arch citiation:
> > Intel 64 and IA-32 Architectures Software Developer’s Manual:
> > The processor’s I/O address space is separate and distinct from
> > the physical-memory address space. The I/O address space consists
> > of 64K individually addressable 8-bit I/O ports, numbered 0 through FFFFH.
> >
> > [c] PCIe spec citation:
> > If a bridge implements an I/O address range,...I/O address range will be
> > aligned to a 4 KB boundary.
> >
> > Overview:
> > ---------
> > Above usecase requirements can be solved by PCI PF group owner accessing
> > its group member PCI VFs legacy registers using an admin virtqueue of
> > the group owner PCI PF.
> >
> > Two new admin virtqueue commands are added which read/write PCI VF
> > registers.
> >
> > The third command suggested by Jason queries the VF device's driver
> > notification region.
> >
> > Software usage example:
> > -----------------------
> > One way to use and map to the guest VM is by using vfio driver
> > framework in Linux kernel.
> >
> >                 +----------------------+
> >                 |pci_dev_id = 0x100X   |
> > +---------------|pci_rev_id = 0x0      |-----+
> > |vfio device    |BAR0 = I/O region     |     |
> > |               |Other attributes      |     |
> > |               +----------------------+     |
> > |                                            |
> > +   +--------------+     +-----------------+ |
> > |   |I/O BAR to AQ |     | Other vfio      | |
> > |   |rd/wr mapper  |     | functionalities | |
> > |   +--------------+     +-----------------+ |
> > |                                            |
> > +------+-------------------------+-----------+
> >        |                         |
> >   +----+------------+       +----+------------+
> >   | +-----+         |       | PCI VF device A |
> >   | | AQ  |-------------+---->+-------------+ |
> >   | +-----+         |   |   | | legacy regs | |
> >   | PCI PF device   |   |   | +-------------+ |
> >   +-----------------+   |   +-----------------+
> >                         |
> >                         |   +----+------------+
> >                         |   | PCI VF device N |
> >                         +---->+-------------+ |
> >                             | | legacy regs | |
> >                             | +-------------+ |
> >                             +-----------------+
> >
> > 2. Virtio pci driver to bind to the listed device id and
> >    use it as native device in the host.
> >
> > 3. Use it in a light weight hypervisor to run bare-metal OS.
> >
> > Please review.
> >
> > Fixes: https://github.com/oasis-tcs/virtio-spec/issues/167
> > Signed-off-by: Parav Pandit <parav@nvidia.com>
> >
> > ---
> > changelog:
> > v1->v2:
> > - addressed comments from Michael
> > - added theory of operation
> > - grammar corrections
> > - removed group fields description from individual commands as
> >   it is already present in generic section
> > - added endianness normative for legacy device registers region
> > - renamed the file to drop vf and add legacy prefix
> > - added overview in commit log
> > - renamed subsection to reflect command
> 
> So as replied in V1, I think it's not a good idea to invent commands
> for a partial transport just for legacy devices. It's better either:
> 
> 1) rebase or collaborate this work on top of the transport virtqueue
> 
> or
> 
> 2) having a PCI over admin virtqueue transport, since this proposal
> has already had BAR access, we can add config space access then it is
> self-contained so we don't need to go through every corner case like
> inventing dedicated commands to accessing some function that is
> duplicated with capabilities. It will become yet another transport and
> legacy support is just a good byproduct.
> 
> Thanks


I thought so too originally. Unfortunately I now think that no, legacy is not
going to be a byproduct of transport virtqueue for modern -
it is different enough that it needs dedicated commands.
Consider simplest case, multibyte fields. Legacy needs multibyte write,
modern does not even need multibyte read.

> >
> > v0->v1:
> > - addressed comments, suggesetions and ideas from Michael Tsirkin and Jason Wang
> > - far more simpler design than MMR access
> > - removed complexities of MMR device ids
> > - removed complexities of MMR registers and extended capabilities
> > - dropped adding new extended capabilities because if if they are
> >   added, a pci device still needs to have existing capabilities
> >   in the legacy configuration space and hypervisor driver do not
> >   need to access them
> >
> >
> > Parav Pandit (2):
> >   transport-pci: Introduce legacy registers access commands
> >   transport-pci: Add legacy register access conformance section
> >
> >  admin.tex                     |   5 +-
> >  conformance.tex               |   2 +
> >  transport-pci-legacy-regs.tex | 133 ++++++++++++++++++++++++++++++++++
> >  transport-pci.tex             |   2 +
> >  4 files changed, 141 insertions(+), 1 deletion(-)
> >  create mode 100644 transport-pci-legacy-regs.tex
> >
> > --
> > 2.26.2
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

