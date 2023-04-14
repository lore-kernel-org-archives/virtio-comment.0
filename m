Return-Path: <virtio-comment-return-5472-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04681C77B61
	for <virtio-comment@archiver.kernel.org>; Fri, 14 Apr 2023 03:18:40 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 5CB7B335BC
	for <virtio-comment@archiver.kernel.org>; Fri, 14 Apr 2023 03:18:38 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 4E8E2986611
	for <virtio-comment@archiver.kernel.org>; Fri, 14 Apr 2023 03:18:38 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 455F1983D9C; Fri, 14 Apr 2023 03:18:38 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 34F73986600
	for <virtio-comment@lists.oasis-open.org>; Fri, 14 Apr 2023 03:18:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-MC-Unique: qsvXdbf2P1udCUbnCzJL-w-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681442313; x=1684034313;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0zkUdRg+ETa/JiayojkiCyuEzqW8vVvZPJxYLcIWisg=;
        b=O2KJTPI/giNb0pzQxbYzKiRV6ON4U+Ocpcf2lkUCO1pi+/dLw8pdZSMEEymEYW9vGn
         MPxdyhCYYqAu+Ns/X3VZ3jcdQQA/5AVruV0J8i8lTyu9iTonhmw+rhDtojYDpliq16LS
         uVwWsf6VxqZhYfotifyInlpXbcrDI7jiioZgAQRFuZ9y8lOHIUyIsDm1cWd+WuE6Der7
         tqmnkXXoDVA9Ey59f7QPkvkiku8tGic3+Rhnb7kUORsoU7qR+y5VkuXxqq1KXkXyUqH9
         3w8RSmkidnyaffowBC5QcOJ6ht5rXg2t3q/B9SfKeWilNH9uHlQtR7bgJV6EYy9z2Kpj
         6uKg==
X-Gm-Message-State: AAQBX9dGYMwBj3hGPKVCEJV5vGKoRPPHyD27D2e0e29Kxcs3YT9C68pu
	jixWuqQc8JKrUZiviYGIwFWO/TfL0xJHQ+AkPVl+tR11KRTh9A5g/t0focBZkoQfSXRrW7Zs1Wb
	iFo8/Vtkuw9tRe8DztueO8uL/CrgO3IPbGHEoA/giOhkWhJmtgA==
X-Received: by 2002:aca:f0b:0:b0:387:5a8c:4125 with SMTP id 11-20020aca0f0b000000b003875a8c4125mr826631oip.3.1681442313636;
        Thu, 13 Apr 2023 20:18:33 -0700 (PDT)
X-Google-Smtp-Source: AKy350Y1csTUNKsjXsz+GuFwrcQhL7vLA0j2pXk5OM8vVP9avGuDjp7YsMTiY1SfV4fGuUl7FY05wqlvNUEKuqsUWmI=
X-Received: by 2002:aca:f0b:0:b0:387:5a8c:4125 with SMTP id
 11-20020aca0f0b000000b003875a8c4125mr826625oip.3.1681442313373; Thu, 13 Apr
 2023 20:18:33 -0700 (PDT)
MIME-Version: 1.0
References: <20230410020906-mutt-send-email-mst@kernel.org>
 <CACGkMEufWUXHKahg3GLOKfV5aptbiek_DKwy+7rCfMya2GPaTQ@mail.gmail.com>
 <20230412000802-mutt-send-email-mst@kernel.org> <CACGkMEshNydwBD=Q0JW-SDY6xyiJ4uVrLn+pxbUrinycBKwsrw@mail.gmail.com>
 <PH0PR12MB548118F57BB4B4A4F8DC9D7ADC9B9@PH0PR12MB5481.namprd12.prod.outlook.com>
 <CACGkMEvYsz1fSPG+fKpRaZ05Ut7ffKwvMPvR8xbRBsXA_6vGQw@mail.gmail.com>
 <PH0PR12MB548137D7A25C99EAA42B4D12DC9B9@PH0PR12MB5481.namprd12.prod.outlook.com>
 <CACGkMEshW82qztmGw8YJWJ8=QCoRd6cPxQ+ySazxsO_o+U6c4Q@mail.gmail.com>
 <PH0PR12MB548147CF939CB9C2A0586310DC9B9@PH0PR12MB5481.namprd12.prod.outlook.com>
 <CACGkMEu2B_GogDR9HUwB7mT8fkGh+Q_buPLz4nhwhK7h9k6BQQ@mail.gmail.com>
 <PH0PR12MB5481F0CF5A555A6BB2CE856CDC9B9@PH0PR12MB5481.namprd12.prod.outlook.com>
 <CACGkMEuNOYOxvcSzrs0UFEyk+xOkGUpOfhK8rOy_Mebz5b5wdg@mail.gmail.com>
 <a74d3107-d38c-df15-e2ff-f848635f24bd@nvidia.com> <CACGkMEt+bGN7UYEopXPj0+deAnYm1VUNp05VvGHcJnkd8LzbGg@mail.gmail.com>
 <f9f01f9d-f6ec-0daa-a11d-c75589dcbe6c@nvidia.com> <CACGkMEskPJgNrBQV10ieSaKCg_kBbi2E0z1BEbdyiiaDdD1zJA@mail.gmail.com>
 <PH0PR12MB54815F0A67A14691CA64D2B4DC999@PH0PR12MB5481.namprd12.prod.outlook.com>
In-Reply-To: <PH0PR12MB54815F0A67A14691CA64D2B4DC999@PH0PR12MB5481.namprd12.prod.outlook.com>
From: Jason Wang <jasowang@redhat.com>
Date: Fri, 14 Apr 2023 11:18:22 +0800
Message-ID: <CACGkMEsYYQTMdhPy2oVoP=2B9jcK+OJ_TPHqdEsip_pjZvyiOA@mail.gmail.com>
To: Parav Pandit <parav@nvidia.com>
Cc: "Michael S. Tsirkin" <mst@redhat.com>, 
	"virtio-dev@lists.oasis-open.org" <virtio-dev@lists.oasis-open.org>, "cohuck@redhat.com" <cohuck@redhat.com>, 
	"virtio-comment@lists.oasis-open.org" <virtio-comment@lists.oasis-open.org>, Shahaf Shuler <shahafs@nvidia.com>, 
	Satananda Burla <sburla@marvell.com>, Maxime Coquelin <maxime.coquelin@redhat.com>, 
	Yan Vugenfirer <yan@daynix.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Subject: Re: [virtio-comment] Re: [PATCH 09/11] transport-pci: Describe PCI
 MMR dev config registers

On Fri, Apr 14, 2023 at 11:13=E2=80=AFAM Parav Pandit <parav@nvidia.com> wr=
ote:
>
>
>
> > From: Jason Wang <jasowang@redhat.com>
> > Sent: Thursday, April 13, 2023 11:09 PM
>
> >
> > Actually not, I think I've mentioned the reason for several times:
> >
> > It's a must for ABI and migration compatibility:
> >
> > 1) The offset is not necessarily a page boundary
> > 2) The length is not necessarily times of a PAGE_SIZE
> > 3) PAGE_SIZE varies among different archs
> > 4) Two vendors may have two different layout for the structure
>
> Migration compatibility check and device composition work will start for =
regular PCI VF in virtio.
> Two vendors will had some level of programmability as well to make this h=
appen.
> It is orthogonal topic.

Actually not, having new blockers for live migration will complicate
the solution in the future.

And 1) 2) 3) can happen even if we don't care about migration compatibility=
, no?

Thanks


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

