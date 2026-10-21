Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.129.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792597377;
	b=zFTzfTs3I2o1Oa+fIAioPz1AljnoiSh0QI+GDdg5pS+mb3cdi/XJEbtWSlDzOwhm8kA/
	 JpK53v++nHtI3FirL2wx0P6KVA512Kps23RkczU5Ej+0003A99LN1uEKUgs8EIOXWiCfh
	 AULRIiYKIhdhjzZwhS4Sqejs4loNfgdwef2DSBUz6qwfI261qeWTGFV4Qzfc36Iqph0Yg
	 YsGIDvavpCkyLK6xMLWKhvp9DOLDe+ukMVGkw8agGn9kqe8UWYMPsQvPVggCWQ5sUTFze
	 ydvOiFCwDB1VTA1QBsSsKmU2pIahN5bFHcTnFRZ16vrrWcJ6Pxlahmjx7nS2TWsOGoQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792597377;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:Received:Date:From:To:Cc:Subject:Message-ID:References:
	 MIME-Version:In-Reply-To:X-Mimecast-Spam-Score:X-Mimecast-MFC-PROC-ID:
	 X-Mimecast-Originator:Content-Type:Content-Disposition:
	 Content-Transfer-Encoding;
	bh=/Fnek5kc5NoW7QU1GzXsGLkVomtygWyw+DexygCID8U=;
	b=jwNvSJarBPDiCjj2w8SGMFpznLAY05hRvih+LwsNzg5ynZG4+DmS+30yE3bRtrqoz2Qs
	 C+33A8wfjqaDHdRzZHiS347HTSTXRGLw5HlOm+3T15xFl1uy/UqBRvKTmN8+KaPZLELms
	 oZztSDYSTCEUkkJtoXn1/RXcl+mzNmGzCu2G/yVg9hAvuZQnRExFwC3WEnmGmJiEWsTya
	 ouln6DamKrhBKVi4y2bKUMtnSR7nMULknyHsR/Sp+VT8vIbcLEwo9jBjBYVZrcbBiUZpM
	 C2K44CyvsklpHAgiyo7ZMASkd6iX8JWGhEa1e/empKnShghvxdMiqo3EIBKoJMdJZXw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=G2KEbi1Z;
	arc=none smtp.remote-ip=170.10.129.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F7FA606A31A
	for <virtio-comment@lists.linux.dev>; Wed, 21 Oct 2026 15:42:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6F7FA606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=G2KEbi1Z
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1792597374;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=/Fnek5kc5NoW7QU1GzXsGLkVomtygWyw+DexygCID8U=;
	b=G2KEbi1Z6kKCH4se8+72yS6SDUug2Prp/eUm6JI37qOYtdcsa5tISHqehRX/X9939jvSDv
	+QxCq22Zlo97BuGDvNAnRCuLsSRKxPW30FXFpxz21MQCwAM0f5/j7iOER5vz7U1qFK1a5k
	dp/ehtWtD10JhMgX1Jyfo2/mAEsPnog=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-551-2h3s4iXLPtanP82domf3Zw-1; Wed, 21 Oct 2026 15:42:52 +0000
X-MC-Unique: 2h3s4iXLPtanP82domf3Zw-1
X-Mimecast-MFC-AGG-ID: 2h3s4iXLPtanP82domf3Zw_1792597371
Received: by mail-wr1-f71.google.com with SMTP id ffacd0b85a97d-48b01a74792so621757f8f.0
        for <virtio-comment@lists.linux.dev>; Wed, 21 Oct 2026 08:42:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792597371; x=1793202171;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=/Fnek5kc5NoW7QU1GzXsGLkVomtygWyw+DexygCID8U=;
        b=FwEoQ12K63PwAG/P+Fb63AW9FtLyOskH+wX1U9lmg/Aj3VJCGve7JGuKKCemiNH22G
         puw6Iu73zkPsrbW2sL7+m5G1FEBYU09RlWSMCXFfyreW43SNOb6otgPcxd/XScJSXF3W
         wTgB3OrxxHKSmp5MqpsGrOWzrZRRRwH4Z4CGOmPMzROSlKpAgojzMOkbhvtxmtmdOK/s
         Jbawh7iPU+YUu+N7iy2qPeQ7MaALB1WQ7d8IRGuy1z2WPdXzz9Ts/Oc98ei1gOyZQbIa
         V6Ryep3HFpteFn2JHS28tH31xOWH4m70iFyK9PYj3dEJsFIlrw36yyQy9MzCcQuG84Vd
         q4uQ==
X-Forwarded-Encrypted: i=1; AKwUvBxahE1F/u4rKkK3b57XwM00RI5BFOBD2wDM7qZ2KxyTa1BOsqeQix//HaGBqUOYs05lvJFNVZtoF3zsDM1IUw==@lists.linux.dev
X-Gm-Message-State: AFq9FYLbwejyvDcUdaIjTgtI2fSfRgAaAgYDqKpqd15AZLNS5OpB/16E
	ErWQdnrcTgmm3GdHDItF0RX7x+Q5DBxi9eO06kBZA2W1HUqkqpZt5/PqRmDuom02Bjjm0lJIQ/e
	UAm9WTNuop3UYB6N93RyKEOC7qUKkC2s8qq95Nnk8Hh8ki1Pc/Cm1Pj4tMZC/5O2ZYlkJ
X-Gm-Gg: AYBFou1RejBf/GoB9txYtLhzhJQuyT9l6Ju78s8iTgAE438kF2Sa3LXpEXAX1lLPGtE
	xCZTRnfDUiXvJTbIyebS7eMPKnQXRXq34IEqU44XjiIaxEOuKJ/iMH25GQ3SKjzFiP9b0EuV7lW
	uRWtKA+DfXFFsmZxdxCDV11T8ApVpbXaf738ub0nFJmSuv6GKC3MbMBjKq0WHpVVkXZfcfxVxEO
	CS67srywvjp5ygUXo9P2fxb8cQxsyYASMGeIAI0Fyu2jmGLE6eKzjb5Iroj9j6FkV9HDjIjCbu0
	EzJWLBbxb2vr3Pkj3UitHnOTCVb5LxMrLnKWS7S4MrB+ZomWpjIq3agUm/fBHX22o0Q=
X-Received: by 2002:a05:6000:1801:b0:486:f9ea:796f with SMTP id ffacd0b85a97d-48e264cd778mr3503264f8f.41.1792597371129;
        Wed, 21 Oct 2026 08:42:51 -0700 (PDT)
X-Received: by 2002:a05:6000:1801:b0:486:f9ea:796f with SMTP id ffacd0b85a97d-48e264cd778mr3503232f8f.41.1792597370612;
        Wed, 21 Oct 2026 08:42:50 -0700 (PDT)
Received: from redhat.com ([2a0d:6fc0:1536:fc00:b838:383:1c7:6e81])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e25828c6dsm6431645f8f.24.2026.10.21.08.42.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 08:42:49 -0700 (PDT)
Date: Wed, 21 Oct 2026 11:42:47 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Alex =?iso-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>
Cc: Bertrand Marquis <bertrand.marquis@arm.com>,
	virtio-comment@lists.linux.dev,
	"Edgar E . Iglesias" <edgar.iglesias@amd.com>,
	Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>,
	Viresh Kumar <viresh.kumar@linaro.org>,
	Armelle Laine <armellel@google.com>
Subject: Re: [PATCH v2 0/6] virtio-msg transport layer
Message-ID: <20261021114219-mutt-send-email-mst@kernel.org>
References: <cover.1781514628.git.bertrand.marquis@arm.com>
 <87ldbuu46o.fsf@draig.linaro.org>
 <20260701181854-mutt-send-email-mst@kernel.org>
 <87mrs7yt4o.fsf@draig.linaro.org>
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Post: <mailto:virtio-comment@lists.linux.dev>
List-Help: <mailto:virtio-comment+help@lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
List-Owner: <mailto:virtio-comment+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
In-Reply-To: <87mrs7yt4o.fsf@draig.linaro.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: BLO6-N7lrVpHH-exBSaslOQ-2_CKCsarsSv0pZ9kN9I_1792597371
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

On Wed, Oct 21, 2026 at 04:23:51PM +0100, Alex Bennée wrote:
> "Michael S. Tsirkin" <mst@redhat.com> writes:
> 
> > On Wed, Jul 01, 2026 at 04:20:47PM +0100, Alex Bennée wrote:
> >> Bertrand Marquis <bertrand.marquis@arm.com> writes:
> >> 
> >> > This series adds the virtio-msg transport layer.
> >> >
> >> > The individuals and organizations involved in this effort have had difficulty in
> >> > using the existing virtio-transports in various situations and desire to add one
> >> > more transport that performs its transport layer operations by sending and
> >> > receiving messages.
> >> >
> >> > Implementations of virtio-msg will normally be done in multiple layers:
> >> > * common / device level
> >> > * bus level
> >> 
> >> If there are no comments how long should we leave it before requesting a vote?
> >
> > for a new transport,during summer vacation time, I'd give it a lot of
> > time.
> 
> How much more time do you think is needed? I think we are keen to
> request a vote soon given we have plenty of working code.
> 
> -- 
> Alex Bennée
> Virtualisation Tech Lead @ Linaro

I'd say it's ok to request a vote.

