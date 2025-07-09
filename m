Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B53AF285066
	for <virtio-comment@lists.linux.dev>; Wed,  9 Jul 2025 10:01:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752055307; cv=none; b=SmbWN8pmGCTG+IJx7mDwgKPmGKKRHIG9WflZSPKUynOEgFoVN4DGnglE+XbMA4cN3uOxUaJonnbQXF7rxu7VyrWCtFoR7ln1PXNrOVPCLeTwLgHj9l4zCMFz9EbCSbAebA/Q68xCTOJv27/5Ip7j6TryR32LRo5QyR2fz1cWua4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752055307; c=relaxed/simple;
	bh=Inscrd7KBGWayWv2ssoh3ibPtoWlwa8KJBCB67S54W8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Wpfv0izqYfJMEees8iNA9xS3jgMMtCeYbKqiOQ7FcDALf8s34axeFOeoIXRMlvcG8vsJOZMnbry6oJkRRLHWzM0n4VcEV5wkUW4tvNvhWL1vxKxWwIXpFglcDXLSQFS58zH03ohdMye9CMgyF9qHJv3Oq56HrrNPJyJuE0CIcKg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=E+Il597J; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="E+Il597J"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1752055303;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Inscrd7KBGWayWv2ssoh3ibPtoWlwa8KJBCB67S54W8=;
	b=E+Il597JynJ5sIWMESBkwcAqIS9kUF72tieLVXz7VO2VU/9AUrkKAlGqNQBrLYzeoTzd47
	QVztTcj6UBs3NWA6eMoqYZJ5pT0x9uYRErn/IfhmerHllMtT4IUSnGeEXIASUxeymCm5Px
	j8a0Kzjj0QnJ2yKqgb6KtqTAXpYhapU=
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com
 [209.85.216.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-159-VxDngjmzMimg0toBezZ-Sg-1; Wed, 09 Jul 2025 06:01:41 -0400
X-MC-Unique: VxDngjmzMimg0toBezZ-Sg-1
X-Mimecast-MFC-AGG-ID: VxDngjmzMimg0toBezZ-Sg_1752055300
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-3141f9ce4e2so7552722a91.1
        for <virtio-comment@lists.linux.dev>; Wed, 09 Jul 2025 03:01:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752055300; x=1752660100;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Inscrd7KBGWayWv2ssoh3ibPtoWlwa8KJBCB67S54W8=;
        b=q5vKN+/Dc8ond2t6DBOxRb6rMmapuP8tszTrOsSq5IhE5iBYwY8nvGwqt/ZqSLrO2U
         eOkRuGJUX2ODiK7XcidofhYZEE7WXwkXGQXQ4qWNJauIsp2UD93TB5EUGhsT3V/84pWM
         LgJTcvC16OYaAiZ80xh1P+7eNuodAShWwYzOCCYFmbSFvptgh/IsZ70sf6C+2CJ3d0Vs
         CzbXyqi7Z6rGznqYkkLtZkeFjAg/EY/7UqEv8c9lxkPAolWKfIF6V+t2QcOwSUJnouGL
         SwLNR57+6h+6Aq7U4RpAtqkoIDzhCu/I0D/IjVOobZ/IYD7codWOsqCtejfRwEHvFCRf
         GBzQ==
X-Forwarded-Encrypted: i=1; AJvYcCWOmW9xpBgIBrnQC9zIw7t8k//DK1A5V9y6wkgpO1TCdgIUBrinpnZugUBNmeDjO82S368wjk6kxyfBippPyA==@lists.linux.dev
X-Gm-Message-State: AOJu0Yz8KcMjhpb0de9lVcCU5+zaVxjZtujaxnpg81uAp/SovLMBV9bu
	Q8J1iO/y8v/keSIGAg2zcJJe3wGPAaO+OB/bsa7Fy65SyJWOyARvudAG6UHUzkCmidoTyimXsb4
	wPJYY9+iYdOy9RuiC9WlmqxJFJuVxPWKLrnXvdg4z9MENQuIvq4hwZlV1uBal9apwLlPzinduJS
	RCOpoOu3nKBhUKdYI1Ru4UtHjtUVTQqhzw8iPIIL5Ck7E=
X-Gm-Gg: ASbGncvx5Hy6OAGYz+4sLFLMNOfQP+eziQv2GyaA0cERyy4YZH/hYmPg5BWvUXHdtYO
	M7se9/AQ/rdduUV+eg4kdthje/ZlcqJO62UUKjMLL+bXjV92ms9N21gOoFODqDI6+qRPRtwIbKV
	S/4wI=
X-Received: by 2002:a17:90b:1812:b0:311:c1ec:7d12 with SMTP id 98e67ed59e1d1-31c2fdc8ee8mr2496234a91.23.1752055300143;
        Wed, 09 Jul 2025 03:01:40 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFuJkR1XBR3tH83iJ5uTPsHC6bN+JiS0fhlyUzdmD7RuWcvStj5w2dL8SUgRBy0oOhSKVIW4pRg5N9vNokTQ7w=
X-Received: by 2002:a17:90b:1812:b0:311:c1ec:7d12 with SMTP id
 98e67ed59e1d1-31c2fdc8ee8mr2496179a91.23.1752055299535; Wed, 09 Jul 2025
 03:01:39 -0700 (PDT)
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250709093456.350242-1-aesteve@redhat.com> <aG454cwrUWP3xjAU@fedora>
 <CY8PR12MB719541D2A89FB2730AED842ADC49A@CY8PR12MB7195.namprd12.prod.outlook.com>
In-Reply-To: <CY8PR12MB719541D2A89FB2730AED842ADC49A@CY8PR12MB7195.namprd12.prod.outlook.com>
From: Albert Esteve <aesteve@redhat.com>
Date: Wed, 9 Jul 2025 12:01:26 +0200
X-Gm-Features: Ac12FXw2YMd9wGPePnxEH1KcY__8jAoWZyEMPRJBYTxTbX7aemrfLv26KGzOwrg
Message-ID: <CADSE00KhZURawiTbCVov7qaZtTUzG6HLcdcH7KTEA5C0vMpJ5A@mail.gmail.com>
Subject: Re: [PATCH v9 0/1] virtio-media: Add device specification
To: Parav Pandit <parav@nvidia.com>
Cc: Matias Ezequiel Vara Larsen <mvaralar@redhat.com>, 
	"virtio-comment@lists.linux.dev" <virtio-comment@lists.linux.dev>, "ribalda@google.com" <ribalda@google.com>, 
	"alex.bennee@linaro.org" <alex.bennee@linaro.org>, "adelva@google.com" <adelva@google.com>, 
	"cohuck@redhat.com" <cohuck@redhat.com>, "hverkuil@xs4all.nl" <hverkuil@xs4all.nl>, 
	"gurchetansingh@google.com" <gurchetansingh@google.com>, 
	"daniel.almeida@collabora.com" <daniel.almeida@collabora.com>, 
	"changyeon@google.com" <changyeon@google.com>, "acourbot@google.com" <acourbot@google.com>, 
	"mst@redhat.com" <mst@redhat.com>, "eballetb@redhat.com" <eballetb@redhat.com>, 
	"agordeev@qti.qualcomm.com" <agordeev@qti.qualcomm.com>, "gnurou@gmail.com" <gnurou@gmail.com>, 
	"dverkamp@chromium.org" <dverkamp@chromium.org>, 
	"nicolas.dufresne@collabora.com" <nicolas.dufresne@collabora.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 7OyQrrPZuWDL5SHQzb8tCQytDhJ36NvUvY9qklnkHxA_1752055300
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 9, 2025 at 11:49=E2=80=AFAM Parav Pandit <parav@nvidia.com> wro=
te:
>
>
> > From: Matias Ezequiel Vara Larsen <mvaralar@redhat.com>
> > Sent: 09 July 2025 03:14 PM
> >
> > On Wed, Jul 09, 2025 at 11:34:55AM +0200, Albert Esteve wrote:
> > > New attempt of including virtio-media
> > > device specification.
> > >
> > > v8->v9:
> > > - Rebased to virtio-1.4
> >
> > I wonder if it wouldn't be better to just send a patch that fixes the s=
eries
> > instead of the whole series again. Such a change would be a non editori=
al
> > change thus not requiring to vote again. The v8 has been already voted =
and
> > accepted.
> >
> > Matias
> >
>
> Right. I was able to apply v9 without merge conflict.
> Even though, I prefer what Matias suggested to send the fixup patch so th=
at v9 does not need to go through the review and vote again.

I'm ok with that. I assumed that as it had no changes from v8
whatsoever, it would not require a vote. If it does, let's disregard
this new version.

What do you mean for a fixup patch? New patch series with just the
changeset required to eliminate the conflict from v8?

>

