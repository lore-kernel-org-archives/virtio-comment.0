Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795722399;
	b=33Fx4nbFnX87p4eSI8B8loFG8X0iyh4x83QMZ6sR7SDfV9tG5AqW5Zv6DFzVIGHYqsw6
	 xhnfGkelV/9xXMmDqbQ7eNgqP4mf1pjLKRjNAa8Td4plJGNTOegEJhDOEsLgOlwkaVRee
	 LfhfPGRKcLb0NJMHdflY3hGZNJOY2gQ2V6n9L7BSMpxQl5OWNNMqPqNCxMkSj6ceanDuc
	 R1g0s295HERCdG7xyyXvDC1pObm7ZzIDZRU4t0HVI2kW/rAjPTNhkph63K2AkKUd8B83U
	 eoR05dmpMkAz3+MXomWINm3mtjT5/ZCxV4W8Npfjtp079LbwXD6OWpDQOb8/kfy7Vqg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795722399;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Type:Content-Transfer-Encoding;
	bh=wfRtTJYzzYnH5Qq9jFwfWBe96p/srM8uopvoJBf8r9Q=;
	b=Xdgcy6IDll5iT+5SRGu4CmVSKO4MXgT8qzgs1888BTV4J9ya5AYfxItkiAaxUQb6duqE
	 ou80we8xAdqhUSDEnapYiZzuVcEl5vaPBcMj5EHQ0jVvRwgFzyk3cSjkrj4ND2Vepcsw4
	 wL0UDP90/lx9G8w/IExIh1/7p2PqoDnoHxQVbpo9maqLT/l1N7IliBa8Xn+6UuAIg7u94
	 2USoAsWENQXfc1QOE1SqTHA2tgDZ3guuYSv7Xy4UBpIOG1/WMyhdSZevtHDt1b5vaTPMG
	 pc5qxfh6MvD/B81CnrhVaNjtz1O1dTIRJMMTm5b46XO8ygG0U/JiTVHsyI5g3trHJpg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=uNGGfn0U;
	arc=none smtp.remote-ip=209.85.128.47
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29D2D606A31E
	for <virtio-comment@lists.linux.dev>; Thu, 26 Nov 2026 19:46:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 29D2D606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=uNGGfn0U
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4a9a8d6cea8so95377255e9.1
        for <virtio-comment@lists.linux.dev>; Thu, 26 Nov 2026 11:46:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1795722397; x=1796327197; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=wfRtTJYzzYnH5Qq9jFwfWBe96p/srM8uopvoJBf8r9Q=;
        b=uNGGfn0UjRvIhvcx2nbczKstIzqc7izA96kEEW8lKCyyl1uu1SNOsRdsQEnZ+Wye6l
         oubQaMoKtkGSCQVz2nabqDhmq/n/FVBmjp9qS3HHZ3/voaNTXs/Ao+cgJ2qYU/RHaTQg
         e2LExaE6Sw7HbIuca8EC/+Ml4zg8eiChUvt5jyyVgWiLQgLTB7D7dVgwz1NJHSp8Eypu
         jOjUgC3vavfmj85bKgk/FGde85nBL551U8ofdnQ/AWBBoPSkZNuXKOCcLpTCLi7zzpL3
         27iOn9LwwNiI3v9OlWL4Lfh0MIt144NF7l/H3Z8dy1ipmtVePIjx80PGh1T6LAyhd4av
         g1mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795722397; x=1796327197;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wfRtTJYzzYnH5Qq9jFwfWBe96p/srM8uopvoJBf8r9Q=;
        b=t2lekl27yD1aqE+WpZm4ma/VBa91mfx+dV/TUuZNcldkqIoDhVXcrwgVZ3ZvZ79g8H
         WiLw8PIhC6NE9yfUuL2NTLyf/sxxx2dsN3geSJUpQL7WKSrMbE0Bf7cXEBJ2gtczqoHE
         77Pv21zu1bgoBqbkHw4r0Lhsg2fSQYFPxESzFxh59DRRZ2KcUbByNom04J3o9+UJ9ciQ
         9xCLWZLRT0VUDepeq3aCbZ5OXR2E9czRd3VRwOi0X9bRM4kvPyTW3AxDGopte27lgiYk
         dFE22vODqoS8r4/Z/yYWGNv9M/p/e8mKCbif6Fnvdevvpk3pqrcmNooKBcArhucLsjZo
         uNTg==
X-Gm-Message-State: APuU4Z8tHPe48UBhegTE1uiyvwtWpLN8zMBsU0iIdkOWEo+XBRBepVvO
	wn/1fGlZ7l+CIs1LZZFUyfz1XnEk68HoWI26xw4SOpVfLrQXE3TaaclWk/UzF5JtBwS43to+/sq
	wQLiy
X-Gm-Gg: AZFdTZeuUb5GQ1bUzm1BLXksy/p9TrdJZRKNui03T8Q+7H8nPD8vgbCDxNeQaWxOZYb
	VGJQj9lpuUctZ8BGv21CEAP/6BDfd7y2++7iRmquWVGvMfZbBCt6yQ9HHdD6V/HAJwRUOgxtz2L
	WD90/NMAlDR6X9Uz2zqpYf0P3C6zu7RgN21fmymqyY45v8wJtPFYJvZRC29l2Z5bSwbs91qxbK2
	W41s8TlGSyg9w0T/D/uRnaClYRnNgAsKbLnu4qNhNCFuQjLiJ7PxqvBKHXwFiE90+An6bSjtVxp
	VJQeVQU13xP9SSfNZcU3h5DIKyCrealtrfqWAEJTi9esCqAlvpekDnPq5DFyhejXHD+fk2DWg8m
	2gXMqTeFRCftHOnaBoVbJRlxsSHBOBGyTCdTg3iwKAhqey87/6pGCJLvKZ7iRI0dcb8PZjj9jB1
	XPn4jZidFMXnHqYVBpfKWqBy7HrFMNiKgXm8/e44NEkCwMhzUKnbdhPOxnB4ylKbno96mMt/6ev
	AImFwejynnS2z1mQqkSCP3i0abjIvta9wiZ4KIOmvi9smwlgSS9TlI3t10Vcwzg/iKtH3DxRCb9
	T4bPUZKaTfyjdYy3vLZohxENlRne
X-Received: by 2002:a05:600c:47d6:b0:4bb:aa6b:b7fc with SMTP id 5b1f17b1804b1-4bbaa6bb854mr49353205e9.15.1795722397209;
        Thu, 26 Nov 2026 11:46:37 -0800 (PST)
Received: from draig.lan ([185.124.0.158])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab69bf680fsm49039896f8f.14.2026.11.26.11.46.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 11:46:33 -0800 (PST)
Received: from draig.lan (localhost [IPv6:::1])
	by draig.lan (Postfix) with ESMTP id 7B4525F913;
	Thu, 26 Nov 2026 19:46:32 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: virtio-comment@lists.linux.dev
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Robin Cover <robin@oasis-open.org>,
	Manos Pitsidianakis <manos.pitsidianakis@linaro.org>
Subject: [PATCH v4 01/12] LICENSE.md: convert html to proper MarkDown
Date: Thu, 26 Nov 2026 19:46:21 +0000
Message-ID: <20261126194632.2429425-2-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261126194632.2429425-1-alex.bennee@linaro.org>
References: <20261126194632.2429425-1-alex.bennee@linaro.org>
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Post: <mailto:virtio-comment@lists.linux.dev>
List-Help: <mailto:virtio-comment+help@lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
List-Owner: <mailto:virtio-comment+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

There is no point embedding HTML inside the markdown document. It just
makes it messy to edit. The boilerplate text is maintained.

Cc: Robin Cover <robin@oasis-open.org>
Reviewed-by: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>
Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

---
v4
  - fix broken link
---
 LICENSE.md | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/LICENSE.md b/LICENSE.md
index ef558ec..8078023 100644
--- a/LICENSE.md
+++ b/LICENSE.md
@@ -1,7 +1,5 @@
-<div>
-<h2>License Terms</h2>
+## License Terms
=20
-<p>Content in this GitHub code repository has been <a href=3D"https://www.=
oasis-open.org/policies-guidelines/ipr#def-contribution">contributed</a> by=
 OASIS TC Members, and is governed by the OASIS policies, including the <a =
href=3D"https://www.oasis-open.org/policies-guidelines/ipr">Intellectual Pr=
operty Rights (IPR) Policy</a>, the <a href=3D"https://www.oasis-open.org/p=
olicies-guidelines/tc-process">Technical Committee (TC) Process</a>, <a hre=
f=3D"https://www.oasis-open.org/policies-guidelines/bylaws">Bylaws</a>, and=
 the Technical Committee's choice of <a href=3D"https://www.oasis-open.org/=
policies-guidelines/ipr#def-ipr-mode">IPR Mode</a> (<i>viz</i>, <a href=3D"=
https://www.oasis-open.org/policies-guidelines/ipr#Non-Assertion-Mode">Non-=
Assertion Mode</a>), including any applicable <a href=3D"https://www.oasis-=
open.org/committees/virtio/ipr.php">declarations</a>. Feedback from non-TC =
members, if any, is governed by the terms of the <a href=3D"https://www.oas=
is-open.org/policies-guidelines/ipr#appendixa">OASIS Feedback License</a>.<=
/p>
+Content in this GitHub code repository has been [contributed](https://www.=
oasis-open.org/policies-guidelines/ipr#def-contribution) by OASIS TC Member=
s, and is governed by the OASIS policies, including the [Intellectual Prope=
rty Rights (IPR) Policy](https://www.oasis-open.org/policies-guidelines/ipr=
), the [Technical Committee (TC) Process](https://www.oasis-open.org/polici=
es-guidelines/tc-process), [Bylaws](https://www.oasis-open.org/policies-gui=
delines/bylaws), and the Technical Committee's choice of [IPR Mode](https:/=
/www.oasis-open.org/policies-guidelines/ipr#def-ipr-mode) (_viz_, [Non-Asse=
rtion Mode](https://www.oasis-open.org/policies-guidelines/ipr#Non-Assertio=
n-Mode)), including any applicable [declarations](https://www.oasis-open.or=
g/committees/virtio/ipr.php). Feedback from non-TC members, if any, is gove=
rned by the terms of the [OASIS Feedback License](https://www.oasis-open.or=
g/policies-guidelines/ipr#appendixa).
=20
-<p>Description of this repository is presented in the <a href=3D"https://g=
ithub.com/oasis-tcs/virtio-spec/blob/master/README.md">README</a> file, and=
 guidelines for contribution/participation are given in the <a href=3D"http=
s://github.com/oasis-tcs/virtio-spec/blob/master/CONTRIBUTING.md">CONTRIBUT=
ING</a> file.</p>
-</div>
+Description of this repository is presented in the [README](https://github=
.com/oasis-tcs/virtio-spec/blob/master/README.md) file, and guidelines for =
contribution/participation are given in the [CONTRIBUTING](https://github.c=
om/oasis-tcs/virtio-spec/blob/master/CONTRIBUTING.md) file.
--=20
2.47.3

