Return-Path: <virtio-comment-return-8678-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34BAFC4167B
	for <virtio-comment@archiver.kernel.org>; Wed, 29 Nov 2023 10:00:18 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 969157484B
	for <virtio-comment@archiver.kernel.org>; Wed, 29 Nov 2023 10:00:17 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 8F37D986874
	for <virtio-comment@archiver.kernel.org>; Wed, 29 Nov 2023 10:00:17 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 85777986656; Wed, 29 Nov 2023 10:00:17 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 783A4986655
	for <virtio-comment@lists.oasis-open.org>; Wed, 29 Nov 2023 10:00:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701252012; x=1701856812;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qfFtZZ4e5KrJzE1bpKnJJb6rkwarY3Ik2ZQMR/fVvyQ=;
        b=NDtRGD3dykBjfU4G13T70rw0lAmbtxwfFZVIpRvbG0UBzqymRJZSTN8NJtQcG6UPCO
         UAxl5QkDVnKE67qVve55OyO8T3pt8fCrRSqqdLxX1wiDl0pNnxevyM3dd6HAE1pnScIu
         9XhpShBgK7S0BEFV2f1fQIomBl79m2cChPKnxEKaLnKzBpYxNTGEHq73wEQew9gqY1WK
         Udb3nmlTk+F12kHXwsTDacGINeUOZtaHIen1CRgEeJkwpFEUw2t8FNGpqEhsDrFE0v4G
         cZkSU4x7CFJDvjhagGFZO5zzi/j2xrOsj6W4V/uZ746n5jqJkpEDVxh5a7V4IL8Shk32
         URhg==
X-Gm-Message-State: AOJu0YwdHoc1c+6W7cUXZ4mk9cVTLT13+XP/KAsJnuMlnApp1bQQQQsD
	ivSLc2uYAmptksrHanLRcfiYgx1P6/cMh0A8tWCyVQ==
X-Google-Smtp-Source: AGHT+IH1a/wmVOD9kO+l9WWgzd+MC2Y8EeWcw97RqFXPRWiDqD0iYW9IZXdhsvAwKIcMJsSH1JK8FSeW2fBg8rM4rDM=
X-Received: by 2002:a05:6512:1054:b0:50b:b588:e5b1 with SMTP id
 c20-20020a056512105400b0050bb588e5b1mr5756228lfb.24.1701252012534; Wed, 29
 Nov 2023 02:00:12 -0800 (PST)
MIME-Version: 1.0
References: <329f386ba6214fb4a58e93a771474d2d@de.adit-jv.com>
 <40kj9.b1c40ocbzv0u@linaro.org> <f41e5129-3b3e-4e11-9cd1-4eb8f15e60ad@opensynergy.com>
In-Reply-To: <f41e5129-3b3e-4e11-9cd1-4eb8f15e60ad@opensynergy.com>
From: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>
Date: Wed, 29 Nov 2023 11:59:56 +0200
Message-ID: <CAAjaMXYMzpXB_F63u+isc6=y55k3kdn+xAnN4+hBeDupivFWFA@mail.gmail.com>
To: "Pape, Andreas (ADITG/ESS3)" <apape@de.adit-jv.com>, Anton Yakovlev <anton.yakovlev@opensynergy.com>
Cc: virtio-comment@lists.oasis-open.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Subject: Re: [virtio-comment] virtio sound: add missing definitions for 12 and
 24kHz sampling rates

On Wed, 29 Nov 2023 at 10:24, Anton Yakovlev
<anton.yakovlev@opensynergy.com> wrote:
>
> Hi Manos, Andreas,
>
> Actually, I think it would make sense to add 12kHz, 24kHz and also 352800=
kHz
> to the list of supported frame rates.
>
>
> Kind regards,
>

Andreas, would you mind re-sending the patch inline as a new thread
with git-send-email instead of an attachment? And we can then review
it formally.



> On 12.11.2023 23:04, Manos Pitsidianakis wrote:
> > Hello Andreas,
> >
> > The spec says it is purposely modeled to be compatible with the HDA spe=
c. HDA
> > is optimized for specific multiples or submultiples of 44.1 kHz and 48 =
kHz.
> > Specifically, look at "5.4 Handling Stream Independent Sample Rates" an=
d
> > "Table 56. Defined Sample Rates". My (unexperienced) understanding of t=
he
> > following statement is that using such rates with controller hardware t=
hat is
> > made for HDA will result in timing issues:
> >
> >> This implies that the controller and link must also provide for an exa=
ct
> >> sample-rendering rate at the codec, in order to avoid any long term dr=
ift
> >> between sample delivery and rendering and the subsequent over(under)-r=
un of
> >> codec buffers.
> >
> > https://ddec1-0-en-ctp.trendmicro.com:443/wis/clicktime/v1/query?url=3D=
https%3a%2f%2fwww.intel.com%2fcontent%2fdam%2fwww%2fpublic%2fus%2fen%2fdocu=
ments%2fproduct%2dspecifications%2fhigh%2ddefinition%2daudio%2dspecificatio=
n.pdf&umid=3Dd569f403-01a9-4519-8038-4bb35906ff78&auth=3D53c7c7de28b92dfd96=
e93d9dd61a23e634d2fbec-cb72c66b78900b97f31176a2a470cdf7d28d8f94
> >
> > If that is the case, I think the best approach would be to specify a no=
n-HDA
> > mode of operation to support more sound hardware. The most straight-for=
ward
> > solution though is for you to resample the audio before and after it go=
es
> > through virtio-sound.
> >
> >
> > Regards,
> >
> > -- Manos Pitsidianakis
> > Emulation and Virtualization Engineer at Linaro Ltd
> >
> > This publicly archived list offers a means to provide input to the
> > OASIS Virtual I/O Device (VIRTIO) TC.
> >
> > In order to verify user consent to the Feedback License terms and
> > to minimize spam in the list archive, subscription is required
> > before posting.
> >
> > Subscribe: virtio-comment-subscribe@lists.oasis-open.org
> > Unsubscribe: virtio-comment-unsubscribe@lists.oasis-open.org
> > List help: virtio-comment-help@lists.oasis-open.org
> > List archive:
> > https://ddec1-0-en-ctp.trendmicro.com:443/wis/clicktime/v1/query?url=3D=
https%3a%2f%2flists.oasis%2dopen.org%2farchives%2fvirtio%2dcomment%2f&umid=
=3Dd569f403-01a9-4519-8038-4bb35906ff78&auth=3D53c7c7de28b92dfd96e93d9dd61a=
23e634d2fbec-0fef9f465f0a04da9ccd68a483603afa78faeb94
> > Feedback License:
> > https://ddec1-0-en-ctp.trendmicro.com:443/wis/clicktime/v1/query?url=3D=
https%3a%2f%2fwww.oasis%2dopen.org%2fwho%2fipr%2ffeedback%5flicense.pdf&umi=
d=3Dd569f403-01a9-4519-8038-4bb35906ff78&auth=3D53c7c7de28b92dfd96e93d9dd61=
a23e634d2fbec-0620b2dca8947547caf1be09cb1b9460071d9c3c
> > List Guidelines:
> > https://ddec1-0-en-ctp.trendmicro.com:443/wis/clicktime/v1/query?url=3D=
https%3a%2f%2fwww.oasis%2dopen.org%2fpolicies%2dguidelines%2fmailing%2dlist=
s&umid=3Dd569f403-01a9-4519-8038-4bb35906ff78&auth=3D53c7c7de28b92dfd96e93d=
9dd61a23e634d2fbec-7f81dc376e1bb26c4ccd422a6585c18e105f677a
> > Committee:
> > https://ddec1-0-en-ctp.trendmicro.com:443/wis/clicktime/v1/query?url=3D=
https%3a%2f%2fwww.oasis%2dopen.org%2fcommittees%2fvirtio%2f&umid=3Dd569f403=
-01a9-4519-8038-4bb35906ff78&auth=3D53c7c7de28b92dfd96e93d9dd61a23e634d2fbe=
c-e64745d0015d08f4923c010538fce9ec55d679ff
> > Join OASIS:
> > https://ddec1-0-en-ctp.trendmicro.com:443/wis/clicktime/v1/query?url=3D=
https%3a%2f%2fwww.oasis%2dopen.org%2fjoin%2f&umid=3Dd569f403-01a9-4519-8038=
-4bb35906ff78&auth=3D53c7c7de28b92dfd96e93d9dd61a23e634d2fbec-0474f1d3e7241=
32ee586e990891b08a79f61f539
>
> --
> Anton Yakovlev
> Senior Software Engineer
>
> OpenSynergy GmbH
> Rotherstr. 20, 10245 Berlin

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

