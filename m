Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6E5C2206BB
	for <virtio-comment@lists.linux.dev>; Tue, 30 Sep 2025 10:14:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759227298; cv=none; b=i+CHIg8xOb58j51yHH0FXboE6OLjJnvN69fI/YMAh2xjkL2Y76WRPsi2rZOnr80N46IDYd1gLHWUPRo2JXnxVLsKqLDNFaatmuBMAZMJ41kfrGF7dOJhM75f2TjgyiRnHAMcrnKRcHBzCLqIpIuGImxwOdWDFlfDQJl9x7hHQQ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759227298; c=relaxed/simple;
	bh=yu4/dfB8pTT035H5r+7MWBZHsyKpnHDkKWci4xnK29c=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=gI2qtNX6/ETO5QPShX8RpZc9j99etGPtsd3osHwTWQPYE0SjGeaZyGJloPMGb9z6bQJ8oimUSCwz4pPqT1pOvkUh9F+F2PmqGQ/S/unnWGhXTqq9KVc0qm/iqymdTbgPTRpwTtaeB76fHny1/e6XD2pMoMvrILx9LaE28tkft8k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=EB2JyGSs; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="EB2JyGSs"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-46e2e6a708fso37198675e9.0
        for <virtio-comment@lists.linux.dev>; Tue, 30 Sep 2025 03:14:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1759227295; x=1759832095; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:user-agent
         :references:in-reply-to:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IZSnt4JXo0+F/2iZiBer5mk+h0mDbsjajLo4SUSIcIo=;
        b=EB2JyGSsO+yknanQLybLI7iiA/duss4w+KVFqi/oGV5Zye6brNF0HYq0YLq1eeQ3hR
         GHnCcn8SYzD09Prw4+fEinuJtuha79V4GbyFUkVBTcxMQawN8HxBcVQLpkjAjWtF3b5Z
         shT1vT35vSFKYuu46ymfejv0HWxW5moNDE8b1s0tA3KCdBr68dOe6hyQegIQRfsL+xzG
         WPVteIUcKHb8ZK6bXHvb8iMfM2XAw1dBCbzxy2pQfWJLTQPPRxVZ2QpwE1mwTTvhp9kW
         ySPUPzBLwWqhoTnaCBayto5fSGhJjBsAyTmDYEEQN1kN9b0Jc25guYFrHgC/WC4JnoLd
         owRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759227295; x=1759832095;
        h=content-transfer-encoding:mime-version:message-id:date:user-agent
         :references:in-reply-to:subject:cc:to:from:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=IZSnt4JXo0+F/2iZiBer5mk+h0mDbsjajLo4SUSIcIo=;
        b=thm/FmJLN8rpzvYMev+2EGMOrfXifT3gAr53iIwBmKXAo53x5mRgmhBqwuP/6GFWcy
         qy3I23zwTleFeYgPxqQcjW+UWGTYF1rQfXVoRQVGsXaGzBUxk/rGYu8rUWaIc0MPDfOr
         YCVPBQ67l3OWysP/JLGSkqWjzSvGRan6e99BsToVlc8v0ZxQQdKsD5QdMKi1UWWgielb
         7dGBhIieaa7oJMrPRPoj740zB+3hmN7YzBW78nv2ZMfR+o0UfvNvXw69XPYnS6gaNlsP
         SUFeo4COiXL2dniZN1cpZIQQSegzGD1yNPoGDZjjWpaYJ8GNHOHBOhb/ZuD3iiaLJabr
         Qnqw==
X-Gm-Message-State: AOJu0Yx/+c4IA21CxJPNDaa0G+npuy2p+V5yMTRuCiJTebT7CX7MUuNj
	y4/fYru4Mc+j6EEcW9Lum2M1j9Wwp/3XYLTIMrPu+PBt93AljuZOTVtd3R2OLosm3ys=
X-Gm-Gg: ASbGncsmMnoXE9l7QaQm93GSURk8VCFIeTIgfotzyUYfG8bF2/EXAAED7kFzQa5eYNZ
	MjFtutL0FGYKNCWSOWMi7FeXmh9pHnFAqhgmti5Zaje1Vtih5xU6vSYGCoegswaZVPq4cj3SEGi
	k6ru7/1uslsfEn3z319ipaB/PMtBzHtVGB60DFndaHTi9XU2xkeGohYk6jLUZdtHfxz+fSPtigr
	oaToV0QbUufCFshMqLYHKFc7Z9uguW53uoil3/kNh7uYOjpGDBC7VYM13df+32Mqlsvhd8nvosU
	znXB8NUe61WJ3V4+nNr9CTMoqPCdhteHkmtBVLWG8sKQxjDxV/QMFS/7qbWCfjOYTAV844jXXFB
	W4dQVccHQ9T66hKifR1ufN33NlePhCn7I1XdK8KY6DFFqkbw=
X-Google-Smtp-Source: AGHT+IHbgwKo28T25ZSpzcyKKs2fuoBoUVSfix1zpIiO0/uqbiHHWJImIHFZxMptkx0yBsT7YqU4Yg==
X-Received: by 2002:a05:600c:8b05:b0:46e:3e82:6551 with SMTP id 5b1f17b1804b1-46e3e826872mr126390675e9.2.1759227295180;
        Tue, 30 Sep 2025 03:14:55 -0700 (PDT)
Received: from draig.lan ([185.126.160.19])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-46e2a7c8531sm263693105e9.0.2025.09.30.03.14.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Sep 2025 03:14:54 -0700 (PDT)
Received: from draig (localhost [IPv6:::1])
	by draig.lan (Postfix) with ESMTP id 4FF6A5F7EE;
	Tue, 30 Sep 2025 11:14:53 +0100 (BST)
From: =?utf-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Matias Ezequiel Vara Larsen <mvaralar@redhat.com>
Cc: virtio-comment@lists.linux.dev,  "Michael S. Tsirkin" <mst@redhat.com>,
  Cornelia Huck <cornelia.huck@redhat.com>,  Bill Mills
 <bill.mills@linaro.org>
Subject: Re: Use of LaTeX for the specification
In-Reply-To: <aNuOyv78T6TaXg6B@fedora> (Matias Ezequiel Vara Larsen's message
	of "Tue, 30 Sep 2025 10:03:22 +0200")
References: <87ms6dl3sh.fsf@draig.linaro.org> <aNuOyv78T6TaXg6B@fedora>
User-Agent: mu4e 1.12.14-dev1; emacs 30.1
Date: Tue, 30 Sep 2025 11:14:53 +0100
Message-ID: <87cy78jlgi.fsf@draig.linaro.org>
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Matias Ezequiel Vara Larsen <mvaralar@redhat.com> writes:

> On Mon, Sep 29, 2025 at 03:41:18PM +0100, Alex Benn=C3=A9e wrote:
>>=20
>> Hi,
>>=20
>> I recently updated my distro to Trixie and found that HTML generation is
>> broken. As far as I can tell this comes down to the use of \cline as
>> shown in this minimal example:
>>=20
>>   \documentclass{article}
>>   \usepackage{hhline}
>>   \begin{document}
>>   \begin{tabular}{ |l||l|l| }
>>   \hline
>>   Bits & Device Specific & Purpose \\
>>   \cline{1-2}
>>   Read / Write & Device Specific & \\
>>   \cline{1-2}
>>   Purpose & Device Specific & \\
>>   \hline
>>   \end{tabular}
>>   \end{document}
>>=20
>> which results in TeX ending early:
>>=20
>>   ! Undefined control sequence.
>>   \f:HBorder ...border-top:1px solid \#\hline:color=20
>>                                                     ;"></td>
>>   l.8 R
>>        ead / Write & Device Specific & \\
>>   ?=20
>>   ! Emergency stop.
>>=20
>> I'm liaising with Debian and the TexLive authors to try and figure out
>> whats going on. However it does raise a bigger question for the
>> specification - why do we use LaTeX?
>>=20
>> I don't doubt that is a powerful typesetting system but its arcane
>> syntax is a bit of a barrier to entry especially for casual
>> contributors. With the recent breakage I wonder if I'm the canary in the
>> coal mine and this will potentially be a problem for everyone else once
>> their TeX setups upgrade.
>>=20
>> I'd like to augment the repo with some GitHub actions so we can keep an
>> upto date rendered draft available as well as some lint checks so we can
>
> I think that is a great idea. I wonder if we can do it in the current
> Github repo. Do you mean to automatically generate `.pdf` from HEAD for
> example?

Yes

I did something similar when we were drafting the virtio-msg spec:

  https://github.com/Linaro/virtio-msg-spec/releases

>
> Matias

--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro
