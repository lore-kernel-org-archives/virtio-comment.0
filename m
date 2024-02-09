Return-Path: <virtio-comment-return-9096-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0974FC48297
	for <virtio-comment@archiver.kernel.org>; Fri,  9 Feb 2024 07:32:10 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 2436E2B079
	for <virtio-comment@archiver.kernel.org>; Fri,  9 Feb 2024 07:32:10 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 0598F9868FF
	for <virtio-comment@archiver.kernel.org>; Fri,  9 Feb 2024 07:32:10 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id DCC9D9843C0; Fri,  9 Feb 2024 07:32:09 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id C8F519868EE;
	Fri,  9 Feb 2024 07:32:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
From: "Pape, Andreas (ADITG/ESS3)" <apape@de.adit-jv.com>
To: Cornelia Huck <cohuck@redhat.com>, "virtio-comment@lists.oasis-open.org"
	<virtio-comment@lists.oasis-open.org>, "virtio-dev@lists.oasis-open.org"
	<virtio-dev@lists.oasis-open.org>, Anton Yakovlev
	<anton.yakovlev@opensynergy.com>
Thread-Topic: [virtio-comment] [PATCH] sound: add sampling rates 12000Hz and
 24000Hz
Thread-Index: AdpYHO/hOzVjIa/BRja4ti9bSsr2dwAJCwKwAISgqoAANXbzMA==
Date: Fri, 9 Feb 2024 07:32:06 +0000
Message-ID: <44d73ef3a3b54fba92f2657a1b4e0d31@de.adit-jv.com>
References: <10d461c112924dce8f29215359889b7b@de.adit-jv.com>
 <8734u3igug.fsf@redhat.com>
In-Reply-To: <8734u3igug.fsf@redhat.com>
Accept-Language: de-DE, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-originating-ip: [10.72.94.129]
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Subject: RE: [virtio-comment] [PATCH] sound: add sampling rates 12000Hz and
 24000Hz

Hello Anton,

finally got it moving,
I'd appreciate your feedback..

Sorry for the noise.

Regards,
Andreas

-----Original Message-----
From: Cornelia Huck <cohuck@redhat.com>=20
Sent: Donnerstag, 8. Februar 2024 07:57
To: Pape, Andreas (ADITG/ESS3) <apape@de.adit-jv.com>; virtio-comment@lists=
.oasis-open.org; virtio-dev@lists.oasis-open.org
Subject: Re: [virtio-comment] [PATCH] sound: add sampling rates 12000Hz and=
 24000Hz

On Mon, Feb 05 2024, "Pape, Andreas (ADITG/ESS3)" <apape@de.adit-jv.com> wr=
ote:

> 24kHz is used for 'super wideband' voice transmission 12kHz is added 'for=
 completeness'
> Fixes:=20
> https://urldefense.proofpoint.com/v2/url?u=3Dhttps-3A__github.com_oasis-
> 2Dtcs_virtio-2Dspec_issues_184&d=3DDwICAQ&c=3DeuGZstcaTDllvimEN8b7jXrwqOf=
-
> v5A_CdpgnVfiiMM&r=3DaWTtojMtCV9SvyEwkpBNuTjVnzMm-Wc09ONKDmVeCUo&m=3DXDUsT=
d
> yRiIauEU-zsLLjB_yiYUGbdqBUswI9y-mAtk_EfNzT50LhiT6Vi3PcX0os&s=3Dh-kPfeihz
> bJFOhrtv05pTeRJq9ilzHEEbdN2WiJ5Qcw&e=3D
>
> Signed-off-by: Andreas Pape <apape@de.adit-jv.com>
> ---
>  device-types/sound/description.tex | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
>
> diff --git a/device-types/sound/description.tex=20
> b/device-types/sound/description.tex
> index 54c9c8e..bad4415 100644
> --- a/device-types/sound/description.tex
> +++ b/device-types/sound/description.tex
> @@ -504,7 +504,9 @@ \subsubsection{PCM Control Messages}\label{sec:Device=
 Types / Sound Device / Dev
>      VIRTIO_SND_PCM_RATE_96000,
>      VIRTIO_SND_PCM_RATE_176400,
>      VIRTIO_SND_PCM_RATE_192000,
> -    VIRTIO_SND_PCM_RATE_384000
> +    VIRTIO_SND_PCM_RATE_384000,
> +    VIRTIO_SND_PCM_RATE_12000,
> +    VIRTIO_SND_PCM_RATE_24000
>  };
> =20
>  struct virtio_snd_pcm_info {

I think there had been a Reviewed-by: for a previous iteration of this patc=
h? We can add it while applying (after voting, which I'm going to initiate)=
; but I'd appreciate it if the previous reviewer could reply here again.


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

