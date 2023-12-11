Return-Path: <virtio-comment-return-8767-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 469FFC4167B
	for <virtio-comment@archiver.kernel.org>; Mon, 11 Dec 2023 07:26:55 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 7208B60D28
	for <virtio-comment@archiver.kernel.org>; Mon, 11 Dec 2023 07:26:54 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 4DB6A986511
	for <virtio-comment@archiver.kernel.org>; Mon, 11 Dec 2023 07:26:54 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 31592983FE3; Mon, 11 Dec 2023 07:26:54 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 201AC9841A2
	for <virtio-comment@lists.oasis-open.org>; Mon, 11 Dec 2023 07:26:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-MC-Unique: cGnMBi04PjeaLiu8OWRqfQ-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702279611; x=1702884411;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=noAWqdXEUn2Jo7I0tlOld7TNiu+otj0iknR7mGTPKuE=;
        b=tcNjojKNW7ga/wIv8Ghc+00Y/WvXRZFZwFyvJkrAZ2oXcsv0GgzA0wgDmDNUZ27ExV
         Zmh9HXyLWuSvpFErdYcEgfgEc0rjO7CbaW5LFGMqB9CHchb6hwbpP9/zN28SCaxGEcYz
         FApNg7gOvCXFtWuv4Du7RjEznZyFd4Xrcs1AAKjFtN6Dw40mfA/jm8I4FJzkZgX16hy1
         K+mMykr6PE5bRmuzK1p9EGp284dXdpbmcmKeBlYbS9kCTArdTlFMh4rwtERl9O79C/gi
         UD6fB+qZcGoLZnRZUMyPbRDKM3xjXWw37UjEZKxqifWWxfwugUU+ePvA2tSbBSARE49E
         SMWw==
X-Gm-Message-State: AOJu0YzMwZDAJ+5etpVdLKE8jls542qIyMmijVAQLugaS+luOK4OPaDC
	HbXwL45Ol9zWMSDZzvmymE/Jr5fJeD3yo374CDxRlJb1e6KdvnyQXWGrJtfmKsAUr6aUDdpwWxY
	6npVC0AuFeUYtxIDOsXBXz9Ir+z2c1fz9pAjivATLPwmMU6tvfQ==
X-Received: by 2002:a05:6808:3a19:b0:3b9:e4e5:e57f with SMTP id gr25-20020a0568083a1900b003b9e4e5e57fmr5676499oib.7.1702279610930;
        Sun, 10 Dec 2023 23:26:50 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEaxgPqc8rFRM2ZFXO9yo0dZ8QMh8slvQSDlnBnmZK5r4TvsybNezyL6q72IQjXYVYjAgAT2l8f2hWVbKbu/y8=
X-Received: by 2002:a05:6808:3a19:b0:3b9:e4e5:e57f with SMTP id
 gr25-20020a0568083a1900b003b9e4e5e57fmr5676485oib.7.1702279610675; Sun, 10
 Dec 2023 23:26:50 -0800 (PST)
MIME-Version: 1.0
References: <cover.1701158152.git.hengqi@linux.alibaba.com>
 <20231204035211-mutt-send-email-mst@kernel.org> <CACGkMEs=aM1n95xWkwJMCrbT1+sW1kHO=r0eMR-07OhrdPW8kw@mail.gmail.com>
 <20231204040528-mutt-send-email-mst@kernel.org> <4dee1860-4790-4217-b13f-3259172b653c@linux.alibaba.com>
 <CACGkMEtDTGafzOo1=-9LDhpQByA9Y=6NtPpUibLc=EVwC4CYXA@mail.gmail.com>
 <d11b39dc-a74b-4bde-9c2d-d7dae09f3c71@linux.alibaba.com> <20231205094318-mutt-send-email-mst@kernel.org>
 <bba2c20b-0f61-43f3-81e5-3311144e6208@linux.alibaba.com> <CACGkMEuGvz0xy9aML4oBJoStx-DW93LnGDdh6JMXyw3AhrgExA@mail.gmail.com>
 <1701849446.0349424-5-xuanzhuo@linux.alibaba.com> <CACGkMEsOeGbP5050RyDhMGvK_ZK=zziEuktWDHy0JCh9WHt8Cg@mail.gmail.com>
 <151752e2-1684-42a8-a53e-722da877c19b@linux.alibaba.com> <47e97f8c-fb88-4f32-8230-5b3357fb8091@linux.alibaba.com>
 <CACGkMEv+f+0cUPaOOpVrt6jofBudGwcG08VS+y_iDbcuU4QGvg@mail.gmail.com>
 <CAOEp5Od5nBs31Fd-4JDNAzexQVdZA-O1o1AmuMzs_rZU=Bq_0A@mail.gmail.com> <9a31bb06-0688-4f54-90cb-a58472505b46@linux.alibaba.com>
In-Reply-To: <9a31bb06-0688-4f54-90cb-a58472505b46@linux.alibaba.com>
From: Jason Wang <jasowang@redhat.com>
Date: Mon, 11 Dec 2023 15:26:39 +0800
Message-ID: <CACGkMEsBdLNtx2Vo2Lo-81rS4h=8wt7JDyejcRC=nxq446stWg@mail.gmail.com>
To: Heng Qi <hengqi@linux.alibaba.com>
Cc: Yuri Benditovich <yuri.benditovich@daynix.com>, "Michael S. Tsirkin" <mst@redhat.com>, 
	virtio-comment@lists.oasis-open.org, Xuan Zhuo <xuanzhuo@linux.alibaba.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Subject: Re: [virtio-comment] Re: [PATCH v4 1/2] virtio-net: update
 description for VIRTIO_NET_F_GUEST_CSUM.

On Mon, Dec 11, 2023 at 10:18=E2=80=AFAM Heng Qi <hengqi@linux.alibaba.com>=
 wrote:
>
>
>
> =E5=9C=A8 2023/12/10 =E4=B8=8B=E5=8D=881:39, Yuri Benditovich =E5=86=99=
=E9=81=93:
> > If somebody explains the problem that this patch addresses it will be v=
ery,
> > _very_ helpful.
> > We _were_ sure that if the host suggests  VIRTIO_NET_F_GUEST_CSUM and t=
he
> > driver acks it - they both can do _more_ than without this feature.
> > Specifically the driver claims that it is able to deal with additional
> > types of incoming packets and such a way the device is able to provide
> > _more_ types of incoming packets than if this feature is not acked..
>
> Hi Yuir.
>
> Why do you think this patch will change that..?
> What types of packets a driver or device can handle will *not change*
> with this patch.

Well, I think the confusion came from you wanting to modify the
definition of VIRTIO_NET_F_GUEST_CSUM.

As discussed, there's no issue with the current definition:

When VIRTIO_NET_F_GUEST_CSUM is negotiated and DATA_VALID is set, the
checksum is still partial.

Or did you see any?

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

