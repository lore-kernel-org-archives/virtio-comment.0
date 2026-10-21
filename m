Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792596236;
	b=PoQYN8G36844agSJ8dTqkwFAfQOUcpkW75lbcDKi/brv1PkA8xy9rEXoov2OcAu8+a+y
	 RSQQYIZmISVCqJ8DCy6wrVKA5ezzWj9F96nrf0UnRoB7Ojn9YDKaxx8BntTkt0ecex7bo
	 lwq5eTilNfKiJm578oBE7PhIa1FaUKINnZFwGp2YSbodHWqVktbFFaehuKJl81yANfxAy
	 rbJMNui68Kr3bnfva38QBKGluo5nLHnTwRKjapTVsli4vqL/UPeZ8mip1bXpn60JWD5TS
	 VeQaoJAUmAFQRLu4+vTMFA9xerUKZSnaAtRYPLYpE+2tYU+yhYG0cF+vtUHCSJy1cvA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792596236;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Received:From:To:Cc:Subject:In-Reply-To:References:User-Agent:Date:
	 Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=Dhyk3siwBleDVUwk2nrC2CZ40Be8Gi0nK6WfNKtPJS4=;
	b=vVfHhOhF8e9IBYba5jyrKcKKYqt3lxh7o8ukETjO/M+c/pZuLzci5E7HT1O4t12xbQ/c
	 8kX3irxwdLXbm71RsbLOp6DHJWLv7NxjB5Bk3sLnIsmbuyUK5ouT7F9vrMpj+ZfjGM9yQ
	 6UGrrrieTZ8gmBhz5Yxg8nkWTv/wDhzDTx/64j67FzIFIsyL03M/Ga7zpmOAS0wJp/F4g
	 ZIFRFSZZEV9IvxirwSjobdsASFOQvqxCufA6XzQLcAdiFlnRM5WeJwVjresXwSscZU0xa
	 FRVqGyaBPbKRcnfkdy7dB4M6iEd8EcHmhFBuOX7pqg/2UJo/8I8UIYgJLHY3ORIFlOQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=kWV8zNmV;
	arc=none smtp.remote-ip=209.85.221.43
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33A3F606A31B
	for <virtio-comment@lists.linux.dev>; Wed, 21 Oct 2026 15:23:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 33A3F606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=kWV8zNmV
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-48afcfc4bf5so814419f8f.1
        for <virtio-comment@lists.linux.dev>; Wed, 21 Oct 2026 08:23:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1792596234; x=1793201034; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :user-agent:references:in-reply-to:subject:cc:to:from:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Dhyk3siwBleDVUwk2nrC2CZ40Be8Gi0nK6WfNKtPJS4=;
        b=kWV8zNmVf6Ek7DUW9llk7m9n+TlRZrC2bB2CIiT6TIOwBTDG0af8xIiQVwH0nLXW0o
         0XjqryoGpuJVyVEM0TikyO4d8F7VCwl1Xrxgc58RFdoTiPrciXY72Agu0Sdk3p3E/eII
         b2d5eWUA34imNQ7s0yHfPaoEnFIneS+PiOv/n6bAhpmg/PloZ24F79jZnDO0niJZlJD6
         pN4CzNPs2ZbzC87WxKrkpZ/pmVmAiy0v6ik57IMDeBrSzfvtq4zqWtoR4DPG0CFINRK0
         enpUFaKRN2DOMVQwzb7K5HL0i9iQ4dHPXdoSPXWT5lQCc9Ati0Taz663CR3cb1o/1Kol
         WIgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792596234; x=1793201034;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :user-agent:references:in-reply-to:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Dhyk3siwBleDVUwk2nrC2CZ40Be8Gi0nK6WfNKtPJS4=;
        b=iPbT7zUot2GPP3Y885/6JCxnxTBVvufKWB4V0vlQ4YVQtDYE8RqvU7yTPO+MLNh06D
         fWgLiIizCITRnLobWbft9dc+wRY1/u39zKYY416OBJvR8ynrJLteAXSPou6B2RBsfDPj
         YbL/4a4/hTiT9Nkl5x87XuhowezLo81I7qVMswaBGWfwChDeBwoDrMW1DyZ03kaQY6ev
         uTxfYnG6NpVMSsYBbwtcz85A/dwbGdO+k3XWRmSAFJRg3sPcI4LHJ/lnEFO5UttxjnX4
         hEka8Bh3IzZfeJWD1KwgFRaEM2sDQbhUTP/FpWr1aGNXGbHD9UhlAMH0pvDxnfdV6ZGd
         vThA==
X-Forwarded-Encrypted: i=1; AKwUvBw2CNPS9SeuesZpxKBCzni0SPQGlUFa4v+aTBy4/MFW+7pXnIEt29csxKXR2dJ/wMUA4O8MlimshxN4uGKKcQ==@lists.linux.dev
X-Gm-Message-State: AFq9FYKJLqyXSLuNx418nk6bVM0wX9Eklj+tQqTFyWsqwDMhWH8PNsLW
	1ADBL5WpQqqNzFW7K1fc1EmRw0pnUdzRYrrWicbIEeZH7SRbZZtgGtRYrrarVqbX1ag=
X-Gm-Gg: AYBFou2jVaj9xO9JcwTtjyMHjEr7RNUrdQGHo3DBk6hbmWx0dgyQBxw9nPWnlXMvOW6
	VuFZNBv3t4qePf5BJiFoU/vmexdqPkA4K4FlI4bP5o6ICdqW5Hlxnld0UHO++uTW2D1VCai9xN0
	iGGI/Ympy1lhXXQR/Rcv82aiE19OsK4148PSxOWw5liHr5liAXLS/UPCJsNn/nDKnMc6Mg76nKQ
	AEdK0vNmRhnhRrOgFqcInYDRlqaeZ3hrrHSv+BH83tjem31xBPPddY3ITWYu6zOLm4qUScH6Nem
	8ZDoeoYJCocEgVx6nXu65RnzuLR5iHzyWOXXR4YzrdrLiat2iK/YchoPtKceAPYQn2buhHc79gE
	WT+SqtVzLnq6gC1dqik1QYj/pvpHKMZvKb8nOpJTnmVAV7DZEKeI04NqLhS4tFLGkN9hPgZ1O50
	cG6fys1y4GuVqoDsv7HYAqoSx3uwW+lcQ/9OqebOqjagf38kX7/q6fggi+oZuk9qWtI4x6rKWYk
	2LYA/FMjgIslRhFlbi3rtRTzuOOkKTH52LAAvZnkcghZYbBGb1x+sg=
X-Received: by 2002:a05:6000:260f:b0:48b:108:48cf with SMTP id ffacd0b85a97d-48e2648cddcmr5489518f8f.25.1792596234197;
        Wed, 21 Oct 2026 08:23:54 -0700 (PDT)
Received: from draig.lan ([185.124.0.158])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e254f093asm6554145f8f.4.2026.10.21.08.23.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 08:23:52 -0700 (PDT)
Received: from draig (localhost [IPv6:::1])
	by draig.lan (Postfix) with ESMTP id BC1465F7FA;
	Wed, 21 Oct 2026 16:23:51 +0100 (BST)
From: =?utf-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: Bertrand Marquis <bertrand.marquis@arm.com>,
  virtio-comment@lists.linux.dev,  "Edgar E . Iglesias"
 <edgar.iglesias@amd.com>,  Arnaud Pouliquen
 <arnaud.pouliquen@foss.st.com>,  Viresh Kumar <viresh.kumar@linaro.org>,
  Armelle Laine <armellel@google.com>
Subject: Re: [PATCH v2 0/6] virtio-msg transport layer
In-Reply-To: <20260701181854-mutt-send-email-mst@kernel.org> (Michael S.
	Tsirkin's message of "Wed, 1 Jul 2026 18:19:30 -0400")
References: <cover.1781514628.git.bertrand.marquis@arm.com>
	<87ldbuu46o.fsf@draig.linaro.org>
	<20260701181854-mutt-send-email-mst@kernel.org>
User-Agent: mu4e 1.14.4; emacs 30.1
Date: Wed, 21 Oct 2026 16:23:51 +0100
Message-ID: <87mrs7yt4o.fsf@draig.linaro.org>
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Post: <mailto:virtio-comment@lists.linux.dev>
List-Help: <mailto:virtio-comment+help@lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
List-Owner: <mailto:virtio-comment+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

"Michael S. Tsirkin" <mst@redhat.com> writes:

> On Wed, Jul 01, 2026 at 04:20:47PM +0100, Alex Benn=C3=A9e wrote:
>> Bertrand Marquis <bertrand.marquis@arm.com> writes:
>>=20
>> > This series adds the virtio-msg transport layer.
>> >
>> > The individuals and organizations involved in this effort have had dif=
ficulty in
>> > using the existing virtio-transports in various situations and desire =
to add one
>> > more transport that performs its transport layer operations by sending=
 and
>> > receiving messages.
>> >
>> > Implementations of virtio-msg will normally be done in multiple layers:
>> > * common / device level
>> > * bus level
>>=20
>> If there are no comments how long should we leave it before requesting a=
 vote?
>
> for a new transport,during summer vacation time, I'd give it a lot of
> time.

How much more time do you think is needed? I think we are keen to
request a vote soon given we have plenty of working code.

--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro
