Return-Path: <virtio-comment-return-8616-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12D47C61DF4
	for <virtio-comment@archiver.kernel.org>; Fri, 24 Nov 2023 11:51:22 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 7813B21698
	for <virtio-comment@archiver.kernel.org>; Fri, 24 Nov 2023 11:51:21 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 6D07C9868B5
	for <virtio-comment@archiver.kernel.org>; Fri, 24 Nov 2023 11:51:21 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 62D4D9862D9; Fri, 24 Nov 2023 11:51:21 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 55D279868A5
	for <virtio-comment@lists.oasis-open.org>; Fri, 24 Nov 2023 11:51:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-MC-Unique: spNEH5ApMfG10iux6OJoSA-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700826678; x=1701431478;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UgMN+JwI6UFeZnO1lmKHFmmI6O8Uy6tBQFh7c7XFNBo=;
        b=C21WbJ1DfIxcOdHZYL9zCG5p6qr7EE3GC4hEZOOC7bW1Zb9F4V7C6oPhVtnJ5lxF6W
         6xAmoXVOeSBDXgfhSmppvqRs8VhWKRo2S4LSeoAVdXQxGGxGbNAfQnjV8xCcULpvGHrO
         wbCKv9P2btfWcSlZpEnhkH53zZqftdXBmnDaXIWY98j/VWXESMd9Q7YJVVXZ/f7joJFP
         9ChYTWEp9KXOHZy5T6S3KoQ5SaOrXotbz8whrj2Wz2gRJ5P1K4GF15sHdVhzBj9swaxV
         x4aWDACikjyMaS27bh8kkDmj/XdArR2EhE/N3vDNXIFqqh+cYf0ftb77rNAc+bGakUd4
         GZ3g==
X-Gm-Message-State: AOJu0YyZakFMyPtss7grpZpr+y+GoOUFgb5mo5G4gCkYgsULgAib1X3x
	i4x+O8jYFPDP+6+aCwUO5iQAVKbLJnCYnGF2AZ3DA/DqNejezf+Rouk/gJHBqW44yVTbTCmeTLl
	e1ZQJwKSsoreOZ7s8nY3j7mx+fVsQ0gKLzjE3OA7LcKTAJXZ/VQqSOmiJVYp+
X-Received: by 2002:a05:6512:401a:b0:50a:40b6:2d32 with SMTP id br26-20020a056512401a00b0050a40b62d32mr2324703lfb.54.1700826677913;
        Fri, 24 Nov 2023 03:51:17 -0800 (PST)
X-Google-Smtp-Source: AGHT+IH/LXUCRuLvX7tS0JzLJ453PyUfOo0EJ8nNhWEYf+UlkWbJxNbr/onaBSOkmFSncYtGOl27h5nbjorWx9oUEVk=
X-Received: by 2002:a05:6512:401a:b0:50a:40b6:2d32 with SMTP id
 br26-20020a056512401a00b0050a40b62d32mr2324687lfb.54.1700826677744; Fri, 24
 Nov 2023 03:51:17 -0800 (PST)
MIME-Version: 1.0
References: <PH0PR12MB54810D15E0897C2435697E39DCB7A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <20231117060456-mutt-send-email-mst@kernel.org> <PH0PR12MB5481AB5ECF613D806C338C54DCB7A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <20231117063406-mutt-send-email-mst@kernel.org> <PH0PR12MB5481089119BAB97C8F4B7CE0DCB7A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <CACGkMEsQorfXDUAv-oesSAVM4A4AdaGuutJ0-5uqGTe1f0kXQw@mail.gmail.com>
 <PH0PR12MB548197D801989844FAA702B5DCBBA@PH0PR12MB5481.namprd12.prod.outlook.com>
 <CACGkMEuCMYYDss=Wmk=03Wpr3Gg2+Cy0tCf-X8r+N1PcjYayVg@mail.gmail.com>
 <PH0PR12MB5481C748270CCD8255ED869EDCBAA@PH0PR12MB5481.namprd12.prod.outlook.com>
 <CACGkMEsYoC7wd70gNu1OXRh7nHGyyaTDm7-GQehJp6QOY8DmFQ@mail.gmail.com> <20231124063537-mutt-send-email-mst@kernel.org>
In-Reply-To: <20231124063537-mutt-send-email-mst@kernel.org>
From: Jason Wang <jasowang@redhat.com>
Date: Fri, 24 Nov 2023 19:51:06 +0800
Message-ID: <CACGkMEsc1879eONsvmOQhpRE0BZ1jRcrd1t-hKrTBLNmPbsDjg@mail.gmail.com>
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: Parav Pandit <parav@nvidia.com>, "Zhu, Lingshan" <lingshan.zhu@intel.com>, 
	"virtio-comment@lists.oasis-open.org" <virtio-comment@lists.oasis-open.org>, 
	"cohuck@redhat.com" <cohuck@redhat.com>, "sburla@marvell.com" <sburla@marvell.com>, 
	Shahaf Shuler <shahafs@nvidia.com>, Maor Gottlieb <maorg@nvidia.com>, Yishai Hadas <yishaih@nvidia.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Subject: Re: [virtio-comment] [PATCH v1 1/8] admin: Add theory of operation
 for device migration

On Fri, Nov 24, 2023 at 7:38=E2=80=AFPM Michael S. Tsirkin <mst@redhat.com>=
 wrote:
>
> On Fri, Nov 24, 2023 at 11:07:53AM +0800, Jason Wang wrote:
> > How TDISP/attestation is related to a specific device driver? How can
> > a legacy DPDK driver break things like attestation here?
> >
> > > Hence it is not applicable.
> >
> > Wow. The legacy tunnel was just invented by you for just several
> > months and soon became a second-class citizen in the proposal here?
>
> Legacy is not going to be a 1st class citizen and that was a
> concious decision the TC made.
> In particular we know straight
> away that there is no way to make them safely work
> while preserving assumptions confidential computing
> guests make (which I guess is what you mean here).

Probably, but I think we need to support its migration without TD.

> The whole point of isolating legacy mess in the special
> commands was so we don't try to support them going forward,
> don't try to add new features for legacy interfaces please.

Thanks


>
> --
> MST
>


This publicly archived list offers a means to provide input to the=0D
OASIS Virtual I/O Device (VIRTIO) TC.=0D
=0D
In order to verify user consent to the Feedback License terms and=0D
to minimize spam in the list archive, subscription is required=0D
before posting.=0D
=0D
Subscribe: virtio-comment-subscribe@lists.oasis-open.org=0D
Unsubscribe: virtio-comment-unsubscribe@lists.oasis-open.org=0D
List help: virtio-comment-help@lists.oasis-open.org=0D
List archive: https://lists.oasis-open.org/archives/virtio-comment/=0D
Feedback License: https://www.oasis-open.org/who/ipr/feedback_license.pdf=0D
List Guidelines: https://www.oasis-open.org/policies-guidelines/mailing-lists=0D
Committee: https://www.oasis-open.org/committees/virtio/=0D
Join OASIS: https://www.oasis-open.org/join/

