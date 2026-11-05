Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.53
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793913343;
	b=fQdA9oR8uCikbjcjvIJs9wv13HQbfLbjA2nWI7EjOBYOPvzzjl+ao058BknS49jnjI/8
	 9+Wod1K4k4JwgT7N50pMBSpmxeJWWNTth2vNF2E64qrZPd5JMFuUnlVEi8ZkrnM3kcVXL
	 j4vGEwHfT2c+XlqPKCiMlZSPoKStsytjttP58yRMGOB0yLHedp7kXDkpPRIUgIyxw9Vqd
	 X+RdS4KoByrY8z09n6lzD9Q3cw3DZ3EvvSwFsxZolltwOd2ToSTQ9Xxvk+/zZiPFY9vtL
	 16YJT4sBv8NKRIWJS1fptxOQhtTC1cl6+uBumVJ+NKhEU9WHKCTdcpn4pjR5Y1/FlRQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793913343;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=ELqp6JznXkMSPQPrOkeBwKuvMHcLThe12rZf+gOv5nU=;
	b=aCnRPHrVmDV91FT9Ud1OyVsRaX7CGOnFA5/EJW61G7jBkBczXE4TLhjjweJOpfRcQ64m
	 jDQSqpIClvyj8/qdsAW1T69dJGw89d5nfnxSijUxpskxCYr4mubxQpGjcHziBcydcasZ1
	 3wNYaQzois/x9S+X0mOvU37mQrcAdDeiPCVLHWXEypY2OYL3UyixgBksVNScVNUWnQxT9
	 u+NpBdDjhuqmhDZCyjMHrxqVaWKjxFz1LofVWbikxHL9RTu0gx2Jwzryjg95N1uFNW1Al
	 ZTmzCeYDuCPds57UIfrpRMPKmH73VMCC8DWbvXm+wM90eGWYt0fsixYAD0sX3WyVDEg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=none header.from=immunant.com;
	spf=none smtp.mailfrom=immunant.com;
	dkim=pass header.d=immunant-com.20260707.gappssmtp.com header.i=@immunant-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=qu07QRST;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.53
Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B5E7606A31B
	for <virtio-comment@lists.linux.dev>; Thu,  5 Nov 2026 21:15:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0B5E7606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=immunant.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=immunant.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=immunant-com.20260707.gappssmtp.com header.i=@immunant-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=qu07QRST
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-6b1aa2848d2so3868346a12.3
        for <virtio-comment@lists.linux.dev>; Thu, 05 Nov 2026 13:15:42 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793913341; cv=none;
        d=google.com; s=arc-20260327;
        b=q4cyBEYkSRXmyBUfrOLCwxxwiHdkuzqSy2KRwsPxfEzTYlFrUpZWD1oS07eK3B76dZ
         7TvAEslB9C4GJ5/hNa2mgirE6LhPUIMW/KMTsQh05aPA+79yzftCfEbe+x5d7ej7LY+r
         JW1mKCFG28YzoH9MRRghgRniel93/j/MySZYIUs1bh6s45AGZvXCK7+wpBEv+rIudBaG
         h8Ac2HVl+ruhx56QTA55S5fjhLqDbJ3Ny9c1sagxE/3QFEE3jbxHqtiSXuy7lhpK0nEC
         eU4bdX7KfmR7wEeBEZGLTklJU9BfDlCTmi1xVOXJbfv/P365TurcVBl8D7gHF1RFuyTO
         bypQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ELqp6JznXkMSPQPrOkeBwKuvMHcLThe12rZf+gOv5nU=;
        fh=qYMfweAWD0Cpq1KvZPPmiziSchgx+AmqNrBq51bhw3E=;
        b=nwiO1J9TYJRFKpnYhEXT/EWzu6rzTdJgUXXLcpQ8L8QQGmRgSGGE48s9VtNGxWcqgq
         Pgiycya80umYMri8eXlB7INZp+0aMZzFy3ytm8yevrqntARVvNDZYqIlliGjxYstcu/A
         XCffeASg1gUl8p3dKuNzICTt2f5ovUFdXaF3dLjKfGgG937FtoUOCGHbhxsjdLrYp2YB
         kjyrTmsXjEnTF9foZNCoAYBjf72zSdqVMIfxJ8To/FtZQiWoi2x/Mj9u2BObn2wds+3i
         nqCn5LSAnOMd8aU3s1mIxBTLnZJf1ZgatYc5SSmfhTXGTjnUCQQlAEdaD9sBncenT9+s
         vYgQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=immunant-com.20260707.gappssmtp.com; s=20260707; t=1793913341; x=1794518141; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ELqp6JznXkMSPQPrOkeBwKuvMHcLThe12rZf+gOv5nU=;
        b=qu07QRSTQy2U99JYEW8nvVEEv7lVO0CfZ2kFvBdbBlUhIBT7xUWnb5fBpzuY6Bel9o
         LhG/iRdJqy/koWI1Lh9BrCoz+HmfOO7K759ImDOoXVCV+rRNXKAiigA5TWnt+IKH01f1
         7xig6HSimotrUcNKV2HTBAS7YTEVDh7K+3PXcVOmJCfnSGpxlB+X7PW/G1yCLlk67M3H
         OV3oLVHDeexKnlGZ//0rFZrAMvdVYSzMqjNye0E2jmH1Z0/hT0WvvFKno8z9qu9qo7X6
         2ZC9+CD661H4FWg+y608YRIPzKrWZW9UdocmT2TRQrkmxLdQHtHC0wF7f57V/AXh2mtJ
         dMug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793913341; x=1794518141;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ELqp6JznXkMSPQPrOkeBwKuvMHcLThe12rZf+gOv5nU=;
        b=hSccUgNJaoFRkpGwfWoKb/g7I2Gt+X3FKsxmKHUgTEKGW+uOya2vTJTHrOQzgN/uuO
         QMFMuw8frb25x3mJ9YQ+5lex9LElK9eyMCrBBkAp/63T65kewHpVfzc+e9d6ULWqYIwF
         JX1m1GXyDizp/kr+00y+iog9l+J99xwbTbFWJ3RyxjwmrTWHh0s5162QbgxxgnyK41OF
         V5PPFreD4GZnFKVyS7Y74w19SYO3zsGcXJvbYWKgt72Z/YmUva4Yd1xGO9Sbk7Z/vgRu
         uYXLJeCjhbYZ/dUxgDA5Jf6wDfccUE9ggOCzrjbv3GMmP+u8pVozOFzPu+NJfCaXD0yI
         N7ng==
X-Forwarded-Encrypted: i=1; AKwUvBztdgJirJWKBOY7Gl71zMrbU9vPw7O3Wnnzh2u9TphT4s8BaTYc72ASX/SLPfDuO/HG0WH894TDuJuRSgxwzA==@lists.linux.dev
X-Gm-Message-State: APuU4Z8aQZQO3we0GYAOk0vs79Ne23LYddnxSeemFsjaOGqHqckPlRT5
	1Ay4ZDyv+1IKVyhU8WqFctGcv1nckg4aEmyAQFeYAcTUdco5Ym7IVDyvl5wkb6pv8kae1oLtE/z
	AI74Ig9y3+kWlSZ6Ypewg067qZUxjKtEuME8uMNqPsA==
X-Gm-Gg: AYBFou2NLhQxbZOhx5LWUAcC1WjD9riWTTcRhR+1KxDgRVnY/ggTcqltRBKqBXL8NDc
	RXvB9Rpk2rPP4o6tlW+qhT9YGlv+1h4a3yuQZEQg6vybh+kaDy3iAfvKbNHl6z/k6dRymR1hF4b
	maeqBEYnI8BhpXj9+dNgRFtNtyrPig4I3iW7M7+V1OATAfY0bRI9g2yO/fV/dY240OmEgzMQkac
	73YYX15T1IUYm9+gEa7ZccTh9og9pnvg/gWcYBZLc3n10ERc4BIdd3MtVdbsqctTVlXDU0JtUPs
	eTw1KBcfwoZtVSB/SpncrhU5/6Zi1ReT7VACYMnOTzWvj/9dkaMZQDPfB+UEeiEZm6VSZZcLqI1
	X2ZAMdeG9HYnGsgVvE2RCLTteyqjNJkpxuJrWD+SPcuGMT4UtIQ==
X-Received: by 2002:a05:6402:4287:b0:6b5:90b5:f609 with SMTP id
 4fb4d7f45d1cf-6b5977e19f4mr315756a12.28.1793913341287; Thu, 05 Nov 2026
 13:15:41 -0800 (PST)
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Post: <mailto:virtio-comment@lists.linux.dev>
List-Help: <mailto:virtio-comment+help@lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
List-Owner: <mailto:virtio-comment+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <cover.1781514628.git.bertrand.marquis@arm.com>
 <87ldbuu46o.fsf@draig.linaro.org> <20260701181854-mutt-send-email-mst@kernel.org>
 <87mrs7yt4o.fsf@draig.linaro.org> <20261021114219-mutt-send-email-mst@kernel.org>
In-Reply-To: <20261021114219-mutt-send-email-mst@kernel.org>
From: Ayrton Munoz <adm@immunant.com>
Date: Thu, 5 Nov 2026 16:19:59 -0500
X-Gm-Features: AclHuK8ut2tYQ4LsF5yRdHHkz4rTEQzLLzRhyyZjC49OGkT5P_Y1eaVu4QVSNiM
Message-ID: <CADC70uNEa24w+PFa8Zv1X14jhheQR45x4fW2dUS4SNjxr_mDFQ@mail.gmail.com>
Subject: Re: [PATCH v2 0/6] virtio-msg transport layer
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
	Bertrand Marquis <bertrand.marquis@arm.com>, virtio-comment@lists.linux.dev, 
	"Edgar E . Iglesias" <edgar.iglesias@amd.com>, Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>, 
	Viresh Kumar <viresh.kumar@linaro.org>, Armelle Laine <armellel@google.com>, 
	Andrei Homescu <ahomescu@immunant.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello,

My colleague Andrei and I at Immunant implemented virtio-msg over ARM
FF-A for a vsock device/driver pair that is included in the Android
Open Source Project. Our implementation includes a vsock device for
TrustZone/driver for a VM and both sides have been tested against
other vsock device/driver implementations. We didn't find any major
issues with the specification, but below are some minor comments on
this spec. We'll send comments specific to FF-A to ARM separately.

1. Address fields in the {GET,SET}_VQUEUE and GET_SHM response structs
(in the PATCH v2 3/6 email) are referred to as physical addresses. For
FF-A these are bus addresses (an area ID + offset), not physical
addresses. The text should state this or specify that the address
space is defined by the bus.

2. It's not clear to me whether this specification allows coalescing
multiple EVENT_{AVAIL,USED} messages into one? Is this decision made
by each specific transport?

best,
Ayrton Mu=C3=B1oz


On Wed, Oct 21, 2026 at 11:48=E2=80=AFAM Michael S. Tsirkin <mst@redhat.com=
> wrote:
>
> On Wed, Oct 21, 2026 at 04:23:51PM +0100, Alex Benn=C3=A9e wrote:
> > "Michael S. Tsirkin" <mst@redhat.com> writes:
> >
> > > On Wed, Jul 01, 2026 at 04:20:47PM +0100, Alex Benn=C3=A9e wrote:
> > >> Bertrand Marquis <bertrand.marquis@arm.com> writes:
> > >>
> > >> > This series adds the virtio-msg transport layer.
> > >> >
> > >> > The individuals and organizations involved in this effort have had=
 difficulty in
> > >> > using the existing virtio-transports in various situations and des=
ire to add one
> > >> > more transport that performs its transport layer operations by sen=
ding and
> > >> > receiving messages.
> > >> >
> > >> > Implementations of virtio-msg will normally be done in multiple la=
yers:
> > >> > * common / device level
> > >> > * bus level
> > >>
> > >> If there are no comments how long should we leave it before requesti=
ng a vote?
> > >
> > > for a new transport,during summer vacation time, I'd give it a lot of
> > > time.
> >
> > How much more time do you think is needed? I think we are keen to
> > request a vote soon given we have plenty of working code.
> >
> > --
> > Alex Benn=C3=A9e
> > Virtualisation Tech Lead @ Linaro
>
> I'd say it's ok to request a vote.
>
>
