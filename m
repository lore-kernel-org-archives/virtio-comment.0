Return-Path: <virtio-comment-return-8052-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 047AAC4332F
	for <virtio-comment@archiver.kernel.org>; Tue, 31 Oct 2023 01:37:02 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 303A9330A5
	for <virtio-comment@archiver.kernel.org>; Tue, 31 Oct 2023 01:37:02 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 250FB986B67
	for <virtio-comment@archiver.kernel.org>; Tue, 31 Oct 2023 01:37:02 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 19858986B5A; Tue, 31 Oct 2023 01:37:02 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 0BE3A986B5B
	for <virtio-comment@lists.oasis-open.org>; Tue, 31 Oct 2023 01:37:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-MC-Unique: s1maSJlOOQ-bYiTcrSPOHQ-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698716217; x=1699321017;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=b8VVuW3tmsM2P9mIcINR90CvJh8G/2TT7xUy0cJ5Y7U=;
        b=rt+jQr7FNAvYEV8GAfNMNG8IiAZqVmk9Bu+2qyNyIzHn1cYmCzsDODmB2bMCWbOt9p
         k9/veVZTG3dOifp/93M0DWqCOcEWdmHb8yRxfP3Z8nHke+JstLOy2egnXYaO6Lry26R6
         T2EshdirOZ30OTMKmw1ILWPwDD5+Ju9V/7VtSzQfACJw7fmnrLBis0EwSU5lyzXKnLf6
         Qkn3ZoVndATrwKEGCQRtBBf4nlWuYHsMch7xB6vOluODMCHmFWv7YrDliZnTimSZ72nS
         NKDgM3CYiaTweqrrol/xS57kGbTYzoskCLZBs1R1Xa3g7Md9sD83k03SpJs4dGkwrZz4
         5DQw==
X-Gm-Message-State: AOJu0YyVZ+N+M88D+rJP0MBGIZP/0hK44gQYRaEixdAnAyVNYo/0AXE1
	EC8fezQrEt5oYluNbLcBLrrMrNk2ph3HOWKM3qvBHjDU1BnmZRr5Efdm6wTYpq3CYC8k4UuAg+x
	h4yGFZMVey9XJJMuZG3JcA3K1EWPsgX+Ru86T0SYtT2frkoiGyQ==
X-Received: by 2002:ac2:43c9:0:b0:508:e4b1:a785 with SMTP id u9-20020ac243c9000000b00508e4b1a785mr6180911lfl.62.1698716217635;
        Mon, 30 Oct 2023 18:36:57 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE+Rx9pzAQgeehayeSjpL6WE27TZSvBPckDnv8XnV7R89VJPtE3ltaDYyJM7DzB0QTLuZHuPwmItHJum3ZlBmY=
X-Received: by 2002:ac2:43c9:0:b0:508:e4b1:a785 with SMTP id
 u9-20020ac243c9000000b00508e4b1a785mr6180899lfl.62.1698716217341; Mon, 30 Oct
 2023 18:36:57 -0700 (PDT)
MIME-Version: 1.0
References: <db0719f9-7dc2-4a96-b10b-ecc3dac1a82b@intel.com>
 <860e52ef-8cfc-408a-b3cc-2551ef6118d1@intel.com> <PH0PR12MB5481F6F9BC5158481EC36AE9DCD5A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <20231018055422-mutt-send-email-mst@kernel.org> <PH0PR12MB548106B7225BAF351241EA8ADCD5A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <CACGkMEsJVxPuxCGjKs3R-kaVGfDMNjtAovM7PpBt3TVd8HON0g@mail.gmail.com>
 <PH0PR12MB5481DD16B25251BAC25AA908DCD8A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <CACGkMEthURdu4UNYXPseA-5g6mci2CFDP_UKKC1qFy+n7NHAKg@mail.gmail.com>
 <PH0PR12MB5481BBC4E48145A02C8963ABDCDFA@PH0PR12MB5481.namprd12.prod.outlook.com>
 <CACGkMEu3nC8G3Xo2EaunQ4k4rnB27UQMUvruXaf81_sZF7w-cQ@mail.gmail.com>
 <PH0PR12MB548120210DC4AC23382D8A99DCDEA@PH0PR12MB5481.namprd12.prod.outlook.com>
 <CACGkMEvwFno6ynKzi1WPAj=fF2xmzRS_kUKfL8UJU8sTcjDHbA@mail.gmail.com>
 <PH0PR12MB548140823FA205FA06597692DCDDA@PH0PR12MB5481.namprd12.prod.outlook.com>
 <d3b029a0-5a50-c697-066a-e4f8e85b807c@redhat.com> <PH0PR12MB5481CE2BD779F1D96914FB6EDCA1A@PH0PR12MB5481.namprd12.prod.outlook.com>
In-Reply-To: <PH0PR12MB5481CE2BD779F1D96914FB6EDCA1A@PH0PR12MB5481.namprd12.prod.outlook.com>
From: Jason Wang <jasowang@redhat.com>
Date: Tue, 31 Oct 2023 09:36:46 +0800
Message-ID: <CACGkMEsC9F0SY=ydOSe+nV11L7d2t1Ypzr6nz_UoUc3w632VUQ@mail.gmail.com>
To: Parav Pandit <parav@nvidia.com>
Cc: "Michael S. Tsirkin" <mst@redhat.com>, "Zhu, Lingshan" <lingshan.zhu@intel.com>, 
	"virtio-comment@lists.oasis-open.org" <virtio-comment@lists.oasis-open.org>, 
	"cohuck@redhat.com" <cohuck@redhat.com>, "sburla@marvell.com" <sburla@marvell.com>, 
	Shahaf Shuler <shahafs@nvidia.com>, Maor Gottlieb <maorg@nvidia.com>, Yishai Hadas <yishaih@nvidia.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Subject: Re: [virtio-comment] Re: [PATCH v1 3/8] device-context: Define the
 device context fields for device migration

On Mon, Oct 30, 2023 at 12:28=E2=80=AFPM Parav Pandit <parav@nvidia.com> wr=
ote:
>
>
> > From: Jason Wang <jasowang@redhat.com>
> > Sent: Monday, October 30, 2023 9:35 AM
> >
> > =E5=9C=A8 2023/10/26 11:50, Parav Pandit =E5=86=99=E9=81=93:
> > >> From: virtio-comment@lists.oasis-open.org
> > >> <virtio-comment@lists.oasis- open.org> On Behalf Of Jason Wang For
> > >> example, you still haven't succeeded in defining passthrough.
> > > It was defined on 19th Oct in [1].
> > > What part is not clear to you in definition of passthrough device?
> > >
> > > [1]
> > > https://lore.kernel.org/virtio-
> > comment/PH0PR12MB5481EA6A4D0C64C5AF6D3A
> > > 57DCD4A@PH0PR12MB5481.namprd12.prod.outlook.com/
> >
> >
> > Let me copy-paste it again:
> >
> > For example, assuming you are correct, you still fail to explain
> >
> > 1) what is trapped and what's not, or what's the boundary
> Passthrough definition was replied few times.
> One of them is here, https://lore.kernel.org/virtio-comment/PH0PR12MB5481=
EA6A4D0C64C5AF6D3A57DCD4A@PH0PR12MB5481.namprd12.prod.outlook.com/
> I don=E2=80=99t know what you mean by 'explain'. What do you want to be e=
xplained?
> What is trapped is listed in https://lore.kernel.org/virtio-comment/PH0PR=
12MB5481EA6A4D0C64C5AF6D3A57DCD4A@PH0PR12MB5481.namprd12.prod.outlook.com/
> What is not trapped is also listed in https://lore.kernel.org/virtio-comm=
ent/PH0PR12MB5481EA6A4D0C64C5AF6D3A57DCD4A@PH0PR12MB5481.namprd12.prod.outl=
ook.com/
> So what more do you want to explain in there?

You explained that MSI-X is trapped but not the others. People may
know why. or what's the boundary to choose to trap or not.

>
> > 2) if the hypervisor is not developed with those assumptions, things ca=
n work
> What to explain in #2. :)
> Things can expand when such hypervisor is born.

So the point is still, to make your proposal to be useful in more use cases=
.

That's it.

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

