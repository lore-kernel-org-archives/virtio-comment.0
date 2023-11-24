Return-Path: <virtio-comment-return-8614-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5750FC61DF4
	for <virtio-comment@archiver.kernel.org>; Fri, 24 Nov 2023 11:38:16 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id A9A8D2CAD4
	for <virtio-comment@archiver.kernel.org>; Fri, 24 Nov 2023 11:38:15 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 6C30D9868A9
	for <virtio-comment@archiver.kernel.org>; Fri, 24 Nov 2023 11:38:15 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 4C3C29862D9; Fri, 24 Nov 2023 11:38:15 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 3C8709868A5
	for <virtio-comment@lists.oasis-open.org>; Fri, 24 Nov 2023 11:38:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-MC-Unique: 1BTEWDZFPDCaQXSCI0e3AA-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700825891; x=1701430691;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HOO3v2BeYwblO2yQ8EVXUfR4hPD01TmFU1oCUKsbLkQ=;
        b=qM1yrPp62LcdqW8jHKO20MYwJaGUYNkqJ7RHcqlVMBGCQqrC8kaLfu91tCHQK0NLAP
         LbEBLh1a+eqFehwwQf6qaL7GGOo3FTD+tOcAjvdSTfD0K97Dd+8tuE0ZfyM1PGj+xHhC
         pe101IPGAac2xpOXP3Of83vnAFzfY69YIMfMw6yRgT9paVKfj8yAVl4dasgRjTbCRMbo
         sYIkHv92bKw+l75LviZg74Jol9CckZDz2lYucqS0SfK995o3rjlVnF91f1aixWOEvh76
         ZwNUtWGNUcIEogSVJCZGUk0SL9Y65GvjnNT+jJK7+tmYr4CH09/CGTj2FqGQBKZ/+t91
         SoDg==
X-Gm-Message-State: AOJu0YyzfTkEJOQvpazCXDThE7CSEVDiT3f4m+yY7abZXV3MHBVAt6ss
	CDWowprsMT9R7Rc4IvW0LJ6ocOa5n8TB6UZy4XYK+E5fLtff+nmWYNxOBI7kxz2KHRNS5lsDcDK
	X35vN09Lh3orlra7Jb3P0XiJhmvLqo43wug==
X-Received: by 2002:a50:ba8b:0:b0:548:b7ee:cf5c with SMTP id x11-20020a50ba8b000000b00548b7eecf5cmr494496ede.37.1700825891705;
        Fri, 24 Nov 2023 03:38:11 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGkBISzthkHFSpsWwac6t0uLO3IfMiOl5HskbmRRJxmCPczJXu4PZ8YU0GCry6cxHEllXgSYw==
X-Received: by 2002:a50:ba8b:0:b0:548:b7ee:cf5c with SMTP id x11-20020a50ba8b000000b00548b7eecf5cmr494478ede.37.1700825891428;
        Fri, 24 Nov 2023 03:38:11 -0800 (PST)
Date: Fri, 24 Nov 2023 06:38:06 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Jason Wang <jasowang@redhat.com>
Cc: Parav Pandit <parav@nvidia.com>,
	"Zhu, Lingshan" <lingshan.zhu@intel.com>,
	"virtio-comment@lists.oasis-open.org" <virtio-comment@lists.oasis-open.org>,
	"cohuck@redhat.com" <cohuck@redhat.com>,
	"sburla@marvell.com" <sburla@marvell.com>,
	Shahaf Shuler <shahafs@nvidia.com>,
	Maor Gottlieb <maorg@nvidia.com>, Yishai Hadas <yishaih@nvidia.com>
Message-ID: <20231124063537-mutt-send-email-mst@kernel.org>
References: <PH0PR12MB54810D15E0897C2435697E39DCB7A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <20231117060456-mutt-send-email-mst@kernel.org>
 <PH0PR12MB5481AB5ECF613D806C338C54DCB7A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <20231117063406-mutt-send-email-mst@kernel.org>
 <PH0PR12MB5481089119BAB97C8F4B7CE0DCB7A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <CACGkMEsQorfXDUAv-oesSAVM4A4AdaGuutJ0-5uqGTe1f0kXQw@mail.gmail.com>
 <PH0PR12MB548197D801989844FAA702B5DCBBA@PH0PR12MB5481.namprd12.prod.outlook.com>
 <CACGkMEuCMYYDss=Wmk=03Wpr3Gg2+Cy0tCf-X8r+N1PcjYayVg@mail.gmail.com>
 <PH0PR12MB5481C748270CCD8255ED869EDCBAA@PH0PR12MB5481.namprd12.prod.outlook.com>
 <CACGkMEsYoC7wd70gNu1OXRh7nHGyyaTDm7-GQehJp6QOY8DmFQ@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CACGkMEsYoC7wd70gNu1OXRh7nHGyyaTDm7-GQehJp6QOY8DmFQ@mail.gmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Subject: Re: [virtio-comment] [PATCH v1 1/8] admin: Add theory of operation
 for device migration

On Fri, Nov 24, 2023 at 11:07:53AM +0800, Jason Wang wrote:
> How TDISP/attestation is related to a specific device driver? How can
> a legacy DPDK driver break things like attestation here?
> 
> > Hence it is not applicable.
> 
> Wow. The legacy tunnel was just invented by you for just several
> months and soon became a second-class citizen in the proposal here?

Legacy is not going to be a 1st class citizen and that was a
concious decision the TC made. In particular we know straight
away that there is no way to make them safely work
while preserving assumptions confidential computing
guests make (which I guess is what you mean here).
The whole point of isolating legacy mess in the special
commands was so we don't try to support them going forward,
don't try to add new features for legacy interfaces please.

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

