Return-Path: <virtio-comment-return-8861-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3334C3DA6E
	for <virtio-comment@archiver.kernel.org>; Mon, 25 Dec 2023 04:18:36 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 1E7A92AF7F
	for <virtio-comment@archiver.kernel.org>; Mon, 25 Dec 2023 04:18:36 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id EE7879863C9
	for <virtio-comment@archiver.kernel.org>; Mon, 25 Dec 2023 04:18:35 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id D3230984A5E; Mon, 25 Dec 2023 04:18:35 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id BEAD998635B
	for <virtio-comment@lists.oasis-open.org>; Mon, 25 Dec 2023 04:18:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-MC-Unique: _2d0pVZYPBOQuSygvuhspQ-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703477912; x=1704082712;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=v+7HC5hSj+ldat6kqR2IUM3tyVsYa8bfcQMh+MKc0rI=;
        b=wFhx1ESKcGoWUYWyj8D9tCa3m4KLxm3BdIrnPh4jn7mTkWE0fvvZAOSX/LViwpxFlM
         rkJMHIbuKIkZplDgpGu+tTye+ISOyIf79STrV8gVAwUb2OZhIe83NlcYkTgV3NY4lg4H
         F7WFWjKcmFxf1YDK0zhSLgbmQlCofqYcjVJaq8A5XksmL8BYHGejlQIQ6+5sUuRoumdJ
         kTmQnRDVQY6M6O1E+55GUkUaO145dWCp0E709EuLGKSl7eS5o9PDx6g3hkCfP10Kqz72
         DiEPBslAdcxk1EWYrD8mCULMN6k+i4T87cdKce16hH3FlwbvwbKYJ9tSfxSPyhrzqWko
         pj9Q==
X-Gm-Message-State: AOJu0Yx5pUfYyErJU596HbHtVanH3QzhrhdunoapMvb5cIi0R/9bMC1p
	X+tapMFPwdhL9EJeDavWIAgb1Kxm2oOoY22D81pkYBGFt6TLmY33kE9qJBnKg36azZSei5TaQWi
	dTh+qpkHwbVP86ssrN9ojGNHBCda0VtVAYUo/sTtc8hk3Q/JXMq0URZssFA==
X-Received: by 2002:a05:6808:2f12:b0:3bb:9fda:2d71 with SMTP id gu18-20020a0568082f1200b003bb9fda2d71mr3115297oib.109.1703477912423;
        Sun, 24 Dec 2023 20:18:32 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGXbCFtEZgbj4FSmPvO6snSvWy8WgRR3aFc6FfcjBB1kuEGlF22XvNaIiDN3kjM+TH/ouHXBuGpyy0dJAubnSM=
X-Received: by 2002:a05:6808:2f12:b0:3bb:9fda:2d71 with SMTP id
 gu18-20020a0568082f1200b003bb9fda2d71mr3115289oib.109.1703477912206; Sun, 24
 Dec 2023 20:18:32 -0800 (PST)
MIME-Version: 1.0
References: <20231218064253.9734-1-peter.hilber@opensynergy.com>
 <20231218064253.9734-4-peter.hilber@opensynergy.com> <87wmt63w1l.fsf@redhat.com>
In-Reply-To: <87wmt63w1l.fsf@redhat.com>
From: Jason Wang <jasowang@redhat.com>
Date: Mon, 25 Dec 2023 12:18:21 +0800
Message-ID: <CACGkMEtCc9n94WCmsPBA2NOMbuXmq9b-M6J02CO9884_5q0nkA@mail.gmail.com>
To: Cornelia Huck <cohuck@redhat.com>
Cc: Peter Hilber <peter.hilber@opensynergy.com>, virtio-comment@lists.oasis-open.org, 
	Parav Pandit <parav@nvidia.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Subject: Re: [virtio-comment] [RFC PATCH v3 3/4] virtio-rtc: Add alarm feature

On Sat, Dec 23, 2023 at 2:57=E2=80=AFAM Cornelia Huck <cohuck@redhat.com> w=
rote:
>
> On Mon, Dec 18 2023, Peter Hilber <peter.hilber@opensynergy.com> wrote:
>
> > Add the VIRTIO_RTC_F_ALARM feature (without normative statements).
> >
> > The intended use case is: A driver needs to react when an alarm time ha=
s
> > been reached, but the driver may be in a sleep state or powered off at
> > alarm time. The alarm feature can resume and notify the driver in this
> > case. Alarms may be retained across device resets (including reset on
> > boot).
>
> Does the driver have some kind of control or information about whether
> alarms are retained? I.e. to start with a clean slate, if wanted.

It might be otherwise we may have security implications?

Userspace driver set the alarm, and the device was shifted to kernel
driver which may get this alarm accidentally?

Thanks

>
> I'm not familiar with RTC, so I'm not sure if that even makes sense, or
> if I have missed something in the spec.
>
>
> This publicly archived list offers a means to provide input to the
> OASIS Virtual I/O Device (VIRTIO) TC.
>
> In order to verify user consent to the Feedback License terms and
> to minimize spam in the list archive, subscription is required
> before posting.
>
> Subscribe: virtio-comment-subscribe@lists.oasis-open.org
> Unsubscribe: virtio-comment-unsubscribe@lists.oasis-open.org
> List help: virtio-comment-help@lists.oasis-open.org
> List archive: https://lists.oasis-open.org/archives/virtio-comment/
> Feedback License: https://www.oasis-open.org/who/ipr/feedback_license.pdf
> List Guidelines: https://www.oasis-open.org/policies-guidelines/mailing-l=
ists
> Committee: https://www.oasis-open.org/committees/virtio/
> Join OASIS: https://www.oasis-open.org/join/
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

