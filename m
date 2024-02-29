Return-Path: <virtio-comment-return-9165-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 085E0C48BF6
	for <virtio-comment@archiver.kernel.org>; Thu, 29 Feb 2024 10:00:03 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 549F0217B9
	for <virtio-comment@archiver.kernel.org>; Thu, 29 Feb 2024 10:00:03 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 30DEE9865D1
	for <virtio-comment@archiver.kernel.org>; Thu, 29 Feb 2024 10:00:03 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 0AA51983E93; Thu, 29 Feb 2024 10:00:03 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id E74BC986530
	for <virtio-comment@lists.oasis-open.org>; Thu, 29 Feb 2024 10:00:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-MC-Unique: y74G8pdmPNy_HKEQ-_-tPw-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709200796; x=1709805596;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AP3jlhkMOpMyc0OYk5Sn8sjvi4Q6I+QHLFmLrJrLroc=;
        b=eLoomoWMBnkcKJ3l8rtueSKOQMYpAimcx3rzhVmEMmBC4oziWTExIPxmm9lJQdcpDM
         7Fh+plIZH6miF/x1uKpoiOElfJ2Dhxoqa3N5YQATIOe4RuqlzULZXEw731CR8s193nio
         pP18BhcYUJ0dH7rGoosOBottDX55iTl6F6Vty+DiD0l8jfHq3ACgbyaugC3r5Bkgm9nb
         IAbgtrOs65cNaB32iyq/gMP9FICpIlq82nsQzG6HujpzRlYIJ7WkauYTSZeP0l0Q6/yj
         V41Q1hqC+dWJP8m0+kQuH/ll4wuMdXjJTzgsUtM30jcu7udWrHOrcgGMU5f6f6pIg5su
         ueLQ==
X-Gm-Message-State: AOJu0YzTvfYNixJkqS4iNkFNCq50vCeJ4XU78zmtimj268HB2GEN4bww
	/jK+OgwgW6O7G34NROd1PLlp5jt0Q2iv6YbFt0D7WvQDvbc9GmTucPxfV6No+cBFBQemHY6IWEC
	TZUC1Au1Fgrwz4b0+C2zb8mhbNw1687venY8cdB7XpytZdMsrnN/rrZ/MpgH76uBjRkciEeis60
	XlKMGsD4NygxKx9m7QkHU/zHRbXnCt7i/7554LvcBiipQ8nxjPsWAkZg==
X-Received: by 2002:a05:6102:5125:b0:472:6344:52d2 with SMTP id bm37-20020a056102512500b00472634452d2mr1785875vsb.11.1709200796740;
        Thu, 29 Feb 2024 01:59:56 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEwHZMngUsxFs+cB1vtU/XE2A83W+rXD+6kH1u9Rk4nHpMDIPLMBz/MwgT1La0aXYgDZfzva9S6+zgleOt0Ptg=
X-Received: by 2002:a05:6102:5125:b0:472:6344:52d2 with SMTP id
 bm37-20020a056102512500b00472634452d2mr1785860vsb.11.1709200796481; Thu, 29
 Feb 2024 01:59:56 -0800 (PST)
MIME-Version: 1.0
References: <Zd9cMvuPQ8VxKOXY@fedora> <17d6675d-f084-4570-97fd-e9a4ddc7c5c5@opensynergy.com>
In-Reply-To: <17d6675d-f084-4570-97fd-e9a4ddc7c5c5@opensynergy.com>
From: Matias Ezequiel Vara Larsen <mvaralar@redhat.com>
Date: Thu, 29 Feb 2024 10:59:45 +0100
Message-ID: <CAHYGQ0wH1E2WZepY=Vvb8o-OR-Lhz2GNYiU67+jLhpJh_yJAWw@mail.gmail.com>
To: Harald Mommer <harald.mommer@opensynergy.com>
Cc: virtio-comment@lists.oasis-open.org
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Subject: Re: [virtio-comment] [PATCH] virtio-can: define out of rage can-id

Hello,

On Wed, Feb 28, 2024 at 7:15=E2=80=AFPM Harald Mommer
<harald.mommer@opensynergy.com> wrote:
>
>
> On 28.02.24 17:15, Matias Ezequiel Vara Larsen wrote:
> > This commit explains when a message is out of range.
> >
> > Signed-off-by: Matias Ezequiel Vara Larsen <mvaralar@redhat.com>
> > ---
> > * This patch applies on top of virtio-1.4, which has not been released
> >    yet.
> > ---
> >   device-types/can/description.tex | 3 +++
> >   1 file changed, 3 insertions(+)
> >
> > diff --git a/device-types/can/description.tex b/device-types/can/descri=
ption.tex
> > index 2511d9c..0a5cf02 100644
> > --- a/device-types/can/description.tex
> > +++ b/device-types/can/description.tex
> > @@ -191,6 +191,9 @@ \subsubsection{Controller Mode}\label{sec:Device Ty=
pes / CAN Device / Device Ope
> >   invalid state with VIRTIO_CAN_RESULT_NOT_OK in \field{result} and MUS=
T
> >   NOT schedule the message for transmission.
> >
> > +Note that a message is out of range when a standard frame uses more th=
an 11
> > +bits of can-id or when an extended frame uses more than 29 bits.
>
>
> "_" and "-" and missing \field{}: It's "\field{can_id}" in the paragraph
> above.
>
> =3D> "can-id" =3D> "\field{can_id}"
>
> Looked through the spec. I did at least not totally forget to mention
> the 11 bits for standard CAN and the 29 bits for extended CAN (line
> 28ff). But could have been expressed more clearly, the note makes it
> clear now.
>

Thanks! I will add those changes in v1.

Matias


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

