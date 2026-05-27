Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E299410D15
	for <virtio-comment@lists.linux.dev>; Wed, 27 May 2026 13:58:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779890318; cv=none; b=GhPKp1XKdMF4HkAWG/ORouKG9RjBitra1+LZU6RXZVZti1fNKDN74OddPnPOA6JnjpFPyz84oPMSwNpFjY+lVDKjjxqJFJ8z0iY1+OKeDYnkwfaANkW0Ay0L/lTkjGogtE1UCdX8CrGSZkXlYOj5PRdKkSi5ULc0WKvjwA1L15Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779890318; c=relaxed/simple;
	bh=EV/1UWZUrxk4of4KmezQBZRthAi+mwRTK11ao9ih3tA=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=PTcthcv+4NNoBbXh55N/1qumyN3Gl4pkry+Nrmh9EHHXqY4hE2zOu+Nh/7SIOp/Er2x+JKAsqI4ecH+z1PgbTAkp0zZOKmDsj2HP5Rxq3RqnIzvKl0K/ZOkJbDN07IU6iUE38/LtytoIkVAU26UgBzQeMWjZyyijnhfcOftoXRE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=GpVR+hZS; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="GpVR+hZS"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-49040362e4aso62364155e9.0
        for <virtio-comment@lists.linux.dev>; Wed, 27 May 2026 06:58:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1779890315; x=1780495115; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:user-agent
         :references:in-reply-to:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ESmKA3kOKqumm8rD2uVv3cCuEluI4N3872qHYDYZCnw=;
        b=GpVR+hZSpKl60zcxMwNVNNGOs1lAxY9CKGq9eo3BelF56L4DNKVyCJ+QzlJnHqyVlQ
         DAz9+VkR5QxOEPRaVC9XEOtlcsUAKFURxDTVOXRo0vExAohvrSMm2fy2MyrilBzv4SaP
         RqNk0hZQB+xYeOgMKvk94o0bI9HSKXYXfqAl0uzJq2LOj6Gkw27pMLxiwz25Ddm5EJgr
         DmgQNlFT4CPBj1DaDqdf9dGOFegJ/ASYnnIooIVcNELqlqSQKMzWWuFaHZCCvkuSFVCW
         /UilEbmklLWL0jFmPkb0vx/EAymIrKXp3B54PDc+MmytJrSIiQCdn+PEnRV4JVOSepA5
         d7ZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779890315; x=1780495115;
        h=content-transfer-encoding:mime-version:message-id:date:user-agent
         :references:in-reply-to:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ESmKA3kOKqumm8rD2uVv3cCuEluI4N3872qHYDYZCnw=;
        b=myMURhqhbxhYLR689IXAT52vVuIJZWPVjBhiBgL8M5HnFYHEG5xlDF3tu89ImJGMRf
         La2W82iKdxhgtUy2i4lj22sfhjlHzf7F0FOEuCeInzgN9L/DQjBkLGs7vDMHCKvOKnsT
         yLp6r9piTtHLzHHqgNm6LI7y0pP3MdFSzU0i/MQp4Iy2j/MGvmkEfLN+OQQmxLfah4C8
         JThMH7clGcZEOI2CZWc9v7b9FZNGHkNLhWCp3IMdrZDeKUYMHnak7FkDj+ARkwGY+bMy
         ujhMakD7h4zdz7L+mllqX/ozLvFrmcOJo+nydfTMkGf2Zb2J9ZKa9UisQGyHv0NPWLSF
         whkw==
X-Forwarded-Encrypted: i=1; AFNElJ9peT5bWdqnJNOoBoFMxzDrVS0t0AHFYhmazkXLjykru+lHOmFOwfqJBmhntaQi6R4jySvJc+QqDf2IeRihgA==@lists.linux.dev
X-Gm-Message-State: AOJu0Yysan7Fgg5JWzThJc7r6gKdpg8990bHXnjTm7KXUEQnuTeqs4cd
	jZPHxexYd/ZDSroVy/3YuppLw3kuwsTrgVpWldGMu+oOT+Wrlf9qUQt/IYD4/3Dzd/Q=
X-Gm-Gg: Acq92OFyey1qrKiSKYYAcZ+ouNGK+wuOG4hxMRzzBoU38B5RO/7iV3jV7zZL/KS7VOY
	KU3W5RHKXgMBxoIKJZaP/bTqyBkB3tqMmi0ZNRyyYt7Po+EJwg9UXBN8aZeCICcGuufRRjPXXJC
	P26R7sKZTBRCqF71fEmR6s5zfGsT6CgnfxhYz6qbZqEA3aVoj3OtDsBvdn9vb9qwgC8LNCNsEx1
	2Un2wAVCAzFf2+P24zMApL/4lrlqsOghWCIyoWA0Y5rJglveNcYBwOszAPfSJB9L8ddKOOUTrue
	L1EkIvIDl+V/K28ZqwODRJjIN7dUGmanwUIt814CSdJPrQWGm6zzaVG/oyluBQ2dxIUOx7stU/U
	ZtgMspaiImPzO2hI1LvB2N3KOwfrhEKF3LqyLD8ossjwSYVHPK5PMnVMdeO8oE/LbXXg/Lwswyc
	uM2Gvny/JIIZ4Fb+W3Xpp2vak=
X-Received: by 2002:a05:600c:6995:b0:490:482c:4384 with SMTP id 5b1f17b1804b1-490482c44ddmr385371215e9.24.1779890314771;
        Wed, 27 May 2026 06:58:34 -0700 (PDT)
Received: from draig.lan ([185.124.0.195])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45edb5c27e7sm6262462f8f.35.2026.05.27.06.58.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 May 2026 06:58:34 -0700 (PDT)
Received: from draig (localhost [IPv6:::1])
	by draig.lan (Postfix) with ESMTP id 11F1F5F7F0;
	Wed, 27 May 2026 14:58:33 +0100 (BST)
From: =?utf-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: qemu-devel <qemu-devel@nongnu.org>,  virtio-comment@lists.linux.dev,
  dev@lists.cloudhypervisor.org,  rust-vmm@lists.opendev.org,  Stefano
 Garzarella <sgarzare@redhat.com>,  Manos Pitsidianakis
 <manos.pitsidianakis@linaro.org>,  Demi Marie Obenour
 <demi@invisiblethingslab.com>,  Alyssa Ross <hi@alyssa.is>,  Albert Esteve
 <aesteve@redhat.com>,  Mark Burton <MBURTON@qti.qualcomm.com>,  Matti
 Moell <matti@qti.qualcomm.com>,  Stefan Hajnoczi <stefanha@redhat.com>,
  Viresh Kumar <viresh.kumar@linaro.org>,  Dorinda Bassey
 <dbassey@redhat.com>,  Sergio Lopez <slp@redhat.com>,  Vishwanath
 Seshagiri <vishs@meta.com>,  Rob Bradford <rbradford@meta.com>,  Zhengyu
 Zhao <zhaozhengyu@bytedance.com>,  "Jorge E. Moreira"
 <jemoreira@google.com>
Subject: Re: Where should the vhost-user specification live?
In-Reply-To: <20260527085058-mutt-send-email-mst@kernel.org> (Michael S.
	Tsirkin's message of "Wed, 27 May 2026 08:55:14 -0400")
References: <874ijtz038.fsf@draig.linaro.org>
	<20260527085058-mutt-send-email-mst@kernel.org>
User-Agent: mu4e 1.14.1; emacs 30.1
Date: Wed, 27 May 2026 14:58:33 +0100
Message-ID: <87zf1lvtrq.fsf@draig.linaro.org>
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

"Michael S. Tsirkin" <mst@redhat.com> writes:

> On Wed, May 27, 2026 at 10:13:47AM +0100, Alex Benn=C3=A9e wrote:
>>=20
>> Hi,
>>=20
>> Apologies for the wide cross-posting but I wanted to find as many
>> interested parties as possible.
>>=20
>> The vhost-user specification currently lives in the main qemu
>> repository (docs/interop/vhost-user.rst) mainly due to historical
>> reasons. QEMU was one of the first VMMs to implement vhost-user and the
>> spec needed to live somewhere.
>>=20
>> However there are now vhost-user implementations for QEMU, rust-vmm,
>> cloud hypervisor and I think CrosVM. We get queries about changing or
>> updating the spec on qemu-devel from time to time and I feel that given
>> it is an interoperability specification we should think about hosting
>> it and its discussions elsewhere.
>>=20
>> I think broadly there are 4 options:
>>=20
>>   *  Move into the OASIS VirtIO group as an appendix/addendum to the main
>>      VirtIO spec.
>>=20
>>      This probably brings the widest visibility to changes to those that
>>      might be affected. However it does come with a certain amount of
>>      bureaucracy with the OASIS process where only members can vote on
>>      changes. While intimately tied to VirtIO it's concerns are more
>>      focused on practical implementation details of the IPC between VMMs
>>      and device backends.
>>=20
>>   * Move to a separate project under the qemu-project space.
>>=20
>>     QEMU hosts a number of sub-projects and mirrors so it would be easy
>>     enough to split the spec into its own repo. Changes to the
>>     specification could then be divorced from QEMU's release cycle and
>>     at the maintainers option issues and merging strategies could be
>>     configured for just the specification.
>>=20
>>   * Create a new project just for vhost-user
>>=20
>>     The interested parties could decide where to host (github, gitlab,
>>     forgejo, whatever..) and decide to move away from mailing lists
>>     altogether or create a mailing list but manage changes via the forge
>>     interface.
>>=20
>>   * Status quo
>>=20
>>     Just keep the spec where it is and muddle through as before. Maybe
>>     we could improve the contribution documentation for how and when
>>     changes are discussed.
>>=20
>> Any thoughts?
>>=20
>> --=20
>> Alex Benn=C3=A9e
>> Virtualisation Tech Lead @ Linaro
>
> I think what is missing here is what are the pros for any of the
> proposed changed?  What are the issues we are trying to solve?
> What 'queries about changing or updating the spec' were problematic?

I was referring to:

  https://lore.kernel.org/qemu-devel/20260522-vhost-user-dev-v1-1-b31646cf1=
9b8@gmail.com

when Demi proposed discussing at the QEMU/KVM community call meeting and
it occurred to me changes to vhost-user affect more than QEMU these days.

>
> Thanks,

--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro
