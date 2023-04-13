Return-Path: <virtio-comment-return-5462-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5767C77B6E
	for <virtio-comment@archiver.kernel.org>; Thu, 13 Apr 2023 21:02:30 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id EC3FF26A2F
	for <virtio-comment@archiver.kernel.org>; Thu, 13 Apr 2023 21:02:29 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id D4B8B98660E
	for <virtio-comment@archiver.kernel.org>; Thu, 13 Apr 2023 21:02:29 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id BF002986197; Thu, 13 Apr 2023 21:02:29 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id AA117986601
	for <virtio-comment@lists.oasis-open.org>; Thu, 13 Apr 2023 21:02:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-MC-Unique: FfmIUE5WObaslJm6QwJ_Pg-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681419746; x=1684011746;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=b6YURbU31d9CI+8xSqryrr/Lnkke9uPnprEkHHofmyM=;
        b=AZP0zEWAIE/QE4h25dLDFecj5MH+XjkUQBlS7sd6e+/2r5oetgNI9YqCsJNGg1Fonj
         A6XiAHRjmIIxnFPf+jDF+BlwK5SSAAasKx6C1GU+rcbn2wsS8aT+Gje6JVLGuZJBc2FM
         LJUbJGHIB4JSkHkla4mnqudr+D++blqZGI9FvuiHnjrlWgrp121WtbXkn/uS45ppNjUT
         8iwIIIT/XYtYHu5W94hmPyFrTNaXmFjrcEfdN1+HZpb158QEJc+zmr/Bp+jJBprYkPS/
         6gdRMWOQuIF33Ft0qJ8DVZM3YeV12+634nP/RSXkzoNyK4DAsiMPSSLkgoN0NtauIGe4
         bP9g==
X-Gm-Message-State: AAQBX9fDNQBCFDY3cLq/7YfbF2IyyO4sBjNVeJsFDnBpUBILecwwb4nJ
	WRWPYuSIoon2Vmag956cR16TbPPUHIur16boBVWJIjilPUSMonFzt4JOCMiUR+nE/Zspn6nYAuf
	zVRu7raJeVG35TcuwGmw5K81hxaedVStoew==
X-Received: by 2002:adf:eb50:0:b0:2f5:a651:6bb4 with SMTP id u16-20020adfeb50000000b002f5a6516bb4mr2641914wrn.24.1681419746238;
        Thu, 13 Apr 2023 14:02:26 -0700 (PDT)
X-Google-Smtp-Source: AKy350YvqjvQonuH+2P6EFyV1DqtVNaQBtnl0icbAohRkz3ltBUbn4OrPKIvSZUcIshZoWIYTsT2XQ==
X-Received: by 2002:adf:eb50:0:b0:2f5:a651:6bb4 with SMTP id u16-20020adfeb50000000b002f5a6516bb4mr2641902wrn.24.1681419745937;
        Thu, 13 Apr 2023 14:02:25 -0700 (PDT)
Date: Thu, 13 Apr 2023 17:02:22 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Parav Pandit <parav@nvidia.com>
Cc: Jason Wang <jasowang@redhat.com>,
	"virtio-dev@lists.oasis-open.org" <virtio-dev@lists.oasis-open.org>,
	"cohuck@redhat.com" <cohuck@redhat.com>,
	"virtio-comment@lists.oasis-open.org" <virtio-comment@lists.oasis-open.org>,
	Shahaf Shuler <shahafs@nvidia.com>,
	Satananda Burla <sburla@marvell.com>,
	Maxime Coquelin <maxime.coquelin@redhat.com>,
	Yan Vugenfirer <yan@daynix.com>
Message-ID: <20230413163216-mutt-send-email-mst@kernel.org>
References: <CACGkMEvYsz1fSPG+fKpRaZ05Ut7ffKwvMPvR8xbRBsXA_6vGQw@mail.gmail.com>
 <PH0PR12MB548137D7A25C99EAA42B4D12DC9B9@PH0PR12MB5481.namprd12.prod.outlook.com>
 <CACGkMEshW82qztmGw8YJWJ8=QCoRd6cPxQ+ySazxsO_o+U6c4Q@mail.gmail.com>
 <PH0PR12MB548147CF939CB9C2A0586310DC9B9@PH0PR12MB5481.namprd12.prod.outlook.com>
 <CACGkMEu2B_GogDR9HUwB7mT8fkGh+Q_buPLz4nhwhK7h9k6BQQ@mail.gmail.com>
 <PH0PR12MB5481F0CF5A555A6BB2CE856CDC9B9@PH0PR12MB5481.namprd12.prod.outlook.com>
 <CACGkMEuNOYOxvcSzrs0UFEyk+xOkGUpOfhK8rOy_Mebz5b5wdg@mail.gmail.com>
 <a74d3107-d38c-df15-e2ff-f848635f24bd@nvidia.com>
 <CACGkMEt+bGN7UYEopXPj0+deAnYm1VUNp05VvGHcJnkd8LzbGg@mail.gmail.com>
 <f9f01f9d-f6ec-0daa-a11d-c75589dcbe6c@nvidia.com>
MIME-Version: 1.0
In-Reply-To: <f9f01f9d-f6ec-0daa-a11d-c75589dcbe6c@nvidia.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Subject: Re: [virtio-comment] Re: [PATCH 09/11] transport-pci: Describe PCI
 MMR dev config registers

On Thu, Apr 13, 2023 at 01:24:24PM -0400, Parav Pandit wrote:
> > > > - work for virtualization (and it work even without dedicated
> > > > mediation for some setups)
> > > I am not aware where can it work without mediation. Do you know any
> > > specific kernel version where it actually works?
> > 
> > E.g current Linux driver did:
> > 
> > rc = pci_request_region(pci_dev, 0, "virtio-pci-legacy");
> > 
> > It doesn't differ from I/O with memory. It means if you had a
> > "transitional" device with legacy MMIO BAR0, it just works.
> > 
> 
> Thanks to the abstract PCI API in Linux.

Right. I do however at least see the point of what Jason is proposing,
which is to enable some legacy guests without mediation in software.

This thing ... you move some code to the card and reduce the amount of
virtio knowledge in software but do not eliminate it completely.
Seems kind of pointless. Minimal hardware changes make more sense to
me, I'd say. Talking about that, what is a minimal hardware change
to allow a vdpa based solution?
I think that's VIRTIO_NET_F_LEGACY_HEADER, right?

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

