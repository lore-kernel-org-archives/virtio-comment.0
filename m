Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.129.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795018331;
	b=c4xp9edyfP5dbxCDaJuz9rSgvrA4cSBbOgP47l/+PwWc1w6L7aAER5vAIwtaszjG0rvB
	 M6ZrmERkjqCGXeMUK6AT72+XAsJxzFP4aEHyioWGTUZf1/cW8LTildBAQH+z5uwadrR+D
	 IZRfXN2e1km/r2pnwFnp+HsSVgScA2SXt/qJHambej8mviJLBVU/z60T7QZ4EYRB9uQB4
	 Ah/z2pOE2RkoWHo2B33hxS37NgL4yEbCxJk1PkUtao2iMCP0tO8eiy4EdkY8JO4Ss0IAs
	 pkcClI1klCjcy54BVQkx08Ue1awh9Bw3R1TpXrl0oq6y+QoU+j/l4Ht0wVl6dE9xBtA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795018331;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:MIME-Version:References:In-Reply-To:From:Date:
	 X-Gm-Features:Message-ID:Subject:To:Cc:X-Mimecast-Spam-Score:
	 X-Mimecast-MFC-PROC-ID:X-Mimecast-Originator:Content-Type:
	 Content-Transfer-Encoding;
	bh=yccWSag3ZEtI0Aa4nM3enFlhMIftXl7egNCcrT6dRYU=;
	b=gAQe8tJTmiZKmaF+au1guUtqc19Z4hW9OIpHgha/a/prMw3dtC/hNnaegwGi2oSC/lda
	 V6OVVMP4VBl1zrtvI+9EumKUMcBzoG4Ws3DAtPw+sjDDt2Mr0cl15ctL0VX5ydWKItTkg
	 gQM7hbxtlvjUPsuREhC48POKgWApPTDwjsZy6R7L5Rhnr5JhNA02vrqE2fSj0Hlr3sWai
	 e/xGMbX7xRqUbwqS5EectZi8GFAudF5rXi0gb9cDF7KqSM7vu4axJqYOnHyoEta9pglfh
	 WR3luDj4i4RaBYuGBHWi2p0Vp2ebk9xRUhECMe0lfbnvpiL6af+At+S2JMaCTIs5RPQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Ofs52ZJU;
	arc=none smtp.remote-ip=170.10.129.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4227606A320
	for <virtio-comment@lists.linux.dev>; Wed, 18 Nov 2026 16:12:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A4227606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Ofs52ZJU
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1795018329;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=yccWSag3ZEtI0Aa4nM3enFlhMIftXl7egNCcrT6dRYU=;
	b=Ofs52ZJUBQwxrJuUrwqgMBHCZ0ZhkT6lngTmw4AUy/dIMOJWfwqut/AUSEdQlWYcbwfaoq
	xB/oDOmxytPFZmH93KMbuC8w/Av1kI9PYfouvEfVr/ElJnuQ6nHxFT3UdVSHkgG7nN7Ian
	3kGAh7otMqpmNsTkpyrUk1MAWiCTIw8=
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-621-jTDysq7-M3qpy1TbG5YrZQ-1; Wed, 18 Nov 2026 11:12:06 -0500
X-MC-Unique: jTDysq7-M3qpy1TbG5YrZQ-1
X-Mimecast-MFC-AGG-ID: jTDysq7-M3qpy1TbG5YrZQ_1795018326
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-920ff6971a1so15974506d6.1
        for <virtio-comment@lists.linux.dev>; Wed, 18 Nov 2026 08:12:06 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795018326; x=1795623126;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yccWSag3ZEtI0Aa4nM3enFlhMIftXl7egNCcrT6dRYU=;
        b=OILvq42+gQFrJgp52iQwG9xY4KlOW3w/kEN+7vIlfTv1+i25sWJMdhlBtoSLByzxwk
         yMJEZQ9Dd0VCVO/ec4fFwgRtfx45b7BAbK+fGNLtgFg7fHqwQBb9sumh1a3cxEb3f12v
         in1lTMYsZDmqwtsQVs2w/uyh/RclHqHigNIBfR+vIYYPmHi79FcnPOMaltzPkGDFAPA8
         akYrc5Cfvf06NTC4uU+GlJPwCeodzo2dasPY3stN0EJ2PPWUVPI7GhtGFwe9TL9KsOuZ
         QiQ3Z+vsm+8JfB0r1MV76L+oheVP93LnCV/YzHw/qJUiVd4F8I6Xj5QKy23Mume6V62e
         w+yg==
X-Forwarded-Encrypted: i=1; AL+hErEBGJYG7i1cv9lHX+u73Zl0EL09R+hpQYgGYaofVqDPPH32sAt9RIyZIyl8KZrG7TyJCfyhhOx7E9bvHkHkFg==@lists.linux.dev
X-Gm-Message-State: APuU4Z80XFHlmPnqiRtQubcxi6lsd0JMDf4QpxknOx3eRRF55KyU1V/U
	lsKq+SV0tRTnjSPtvcVI7Ikl8XvyzPj+ysxQO0o5RIjPjpr6PxWZ+i04Nbs0QSmlDkFPOl7PfFA
	a8oiS9vOyjurXi6Je6as4gUcurUzZCkcbpZa7GHExZuVwixv85tqriF5NDV7GcLd58LbZkjpiJ/
	bKS6CzLEc6nnAfmVpBrBjTTBnR24O/D/TAThGIt7muXtw=
X-Gm-Gg: AZFdTZerbRuBDpKeJIMn0bIIXift0td9TPfwksTsFt2Q4DRr+D6kKUPKP/E1b7ZmHEG
	simF1otcaIsbWIk77rlh9C0mQ6dbh9PwNICChK1Qv3eotlfIR2rSHG4cUfVJWTHjKiAKUXQ+mWs
	grjCshnV+4OMX9EkscldgyUyS4uaDdcU5p2xnksDpiP7+Wq+CE1ZZ9Acqgl5cSeBHPWM0k1GwaI
	rCd2qk1O7Odvu8sR+3UZ7ZAatX00CU8p+TJ1/jxuj0c9Q==
X-Received: by 2002:a05:6214:d83:b0:921:227f:6971 with SMTP id 6a1803df08f44-921227f69b5mr8629616d6.36.1795018325473;
        Wed, 18 Nov 2026 08:12:05 -0800 (PST)
X-Received: by 2002:a05:6214:d83:b0:921:227f:6971 with SMTP id
 6a1803df08f44-921227f69b5mr8628646d6.36.1795018324779; Wed, 18 Nov 2026
 08:12:04 -0800 (PST)
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Post: <mailto:virtio-comment@lists.linux.dev>
List-Help: <mailto:virtio-comment+help@lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
List-Owner: <mailto:virtio-comment+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261118113242.59167-1-dbassey@redhat.com> <7fc62ef8-f323-497e-bb5f-25bbbcd9992a@collabora.com>
 <bef167e8-73d1-417b-b0f1-3e4b93af968a@collabora.com>
In-Reply-To: <bef167e8-73d1-417b-b0f1-3e4b93af968a@collabora.com>
From: Dorinda Bassey <dbassey@redhat.com>
Date: Wed, 18 Nov 2026 17:11:53 +0100
X-Gm-Features: Aa3M54qOq0lKokUTZLkUVZ3S33t0wCLcKonqMfZf-zGMEkz-yCPDSoVKa-G2pM0
Message-ID: <CACzuRyxAH8pWNQnaF-Qo=0MjA_KBz2835DQ9h00tbhTV9087fQ@mail.gmail.com>
Subject: Re: [PATCH] virtio-gpu: Add VIRTIO_GPU_CAPSET_DRM capset definition
To: Dmitry Osipenko <dmitry.osipenko@collabora.com>
Cc: Michael Riesch <michael.riesch@collabora.com>, virtio-comment@lists.linux.dev, 
	"Michael S. Tsirkin" <mst@redhat.com>, Matias Ezequiel Vara Larsen <mvaralar@redhat.com>, slp@redhat.com, mhrica@redhat.com, 
	aesteve@redhat.com, sgarzare@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: xlFZgEddylSvfgUHIc6RinjN_bp0siCensN2UBXIUHc_1795018326
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Dmitry,

> There is [1] that I thought was merged long time ago. Apparently it's not=
?
> [1] https://github.com/oasis-tcs/virtio-spec/issues/182

Thanks for pointing this out. I wasn't aware that there was already an
issue open for this.
I guess we can drop this patch in favour of the one you posted.

BR,
Dorinda.


On Wed, Nov 18, 2026 at 4:24=E2=80=AFPM Dmitry Osipenko
<dmitry.osipenko@collabora.com> wrote:
>
> On 11/18/26 18:14, Michael Riesch wrote:
> > Hi Dorinda,
> >
> > Thanks for the patch! It's great to see this happening. We have been
> > using this for a while now but it felt sort of weird to not have it in
> > the spec.
> >
> > On 11/18/26 12:32, Dorinda Bassey wrote:
> >> The specification currently defines capsets 1-5, but the Linux
> >> kernel has supported VIRTIO_GPU_CAPSET_DRM (ID 6) since commit
> >> 7214da0ed ("drm/virtio: Add DRM capset definition", July 2024).
> >>
> >> VIRTIO_GPU_CAPSET_DRM enables DRM native context support for
> >> direct rendering without GL/Vulkan translation layers, allowing
> >> applications to use native DRM APIs for lower latency GPU
> >> access and compute workloads.
> >>
> >> Add VIRTIO_GPU_CAPSET_DRM definition with ID 6 to align the
> >> specification with the kernel UAPI and device implementations.
> >>
> >> Signed-off-by: Dorinda Bassey <dbassey@redhat.com>
> >
> > Reviewed-by: Michael Riesch <michael.riesch@collabora.com>
> >
> > Best regards,
> > Michael
> >
> >> ---
> >>   device-types/gpu/description.tex | 3 +++
> >>   1 file changed, 3 insertions(+)
> >>
> >> diff --git a/device-types/gpu/description.tex b/device-types/gpu/descr=
iption.tex
> >> index ac3b427..2d7ffa6 100644
> >> --- a/device-types/gpu/description.tex
> >> +++ b/device-types/gpu/description.tex
> >> @@ -542,6 +542,8 @@ \subsubsection{Device Operation: controlq}\label{s=
ec:Device Types / GPU Device /
> >>      Mesa's (mostly) autogenerated Vulkan protocol.
> >>     \item \href{https://chromium.googlesource.com/chromiumos/platform/=
crosvm/+/refs/heads/main/rutabaga_gfx/src/cross_domain/cross_domain_protoco=
l.rs}{VIRTIO_GPU_CAPSET_CROSS_DOMAIN} --
> >>      protocol for display virtualization via Wayland proxying.
> >> +  \item \href{https://www.kernel.org/doc/html/latest/gpu/drm-uapi.htm=
l}{VIRTIO_GPU_CAPSET_DRM} --
> >> +    DRM native context support for direct rendering without GL/Vulkan=
 translation.
> >>     \end{itemize*}
> >>
> >>   \begin{lstlisting}
> >> @@ -556,6 +558,7 @@ \subsubsection{Device Operation: controlq}\label{s=
ec:Device Types / GPU Device /
> >>   #define VIRTIO_GPU_CAPSET_GFXSTREAM 3
> >>   #define VIRTIO_GPU_CAPSET_VENUS 4
> >>   #define VIRTIO_GPU_CAPSET_CROSS_DOMAIN 5
> >> +#define VIRTIO_GPU_CAPSET_DRM 6
> >>   struct virtio_gpu_resp_capset_info {
> >>           struct virtio_gpu_ctrl_hdr hdr;
> >>           le32 capset_id;
> >
>
> There is [1] that I thought was merged long time ago. Apparently it's not=
?
>
> [1] https://github.com/oasis-tcs/virtio-spec/issues/182
>
> --
> Best regards,
> Dmitry
>

