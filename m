Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8237F2FBE1B
	for <virtio-comment@lists.linux.dev>; Fri, 10 Oct 2025 16:29:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760113746; cv=none; b=R95fWnknhGYRhd4byKr1mwmTa9Mjc6+wTRuG9/EehVDlWWN24L5RVXpW+DLzAazAqAfvM+qxBleMK1mRo2eHO4ZvCRTMNaEoQed04w3VaAg0QOMo2c3oV1ePp/KQy3mjPm7IdAuohkO63f2WKmFX/iPX/UR9u1rYcuoZyl4agbs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760113746; c=relaxed/simple;
	bh=I3U3z+MxtHRc1TbZfMT65//LhXVgyA4kIa04lLEyNEQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Xx8+r/XlwecqWL3IVELBwxy64JQwZxK/YhBaQV64o3kzaIt+10KFiucgqQQSLX1GfIomeuLZyvXWM862OVj5+Pgm4h7OMxZ+z7GTICbjz42LShCy/jmKfT++4Zs3LCoBdxk3olAn7AHSr8jNg6oD1aA3Oalf6/tFnXNKWTqv5rA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=tcHdyeGS; arc=none smtp.client-ip=209.85.208.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="tcHdyeGS"
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-62fca01f0d9so4487208a12.3
        for <virtio-comment@lists.linux.dev>; Fri, 10 Oct 2025 09:29:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1760113743; x=1760718543; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=I3U3z+MxtHRc1TbZfMT65//LhXVgyA4kIa04lLEyNEQ=;
        b=tcHdyeGSAPKRjwp8sje1QfFnsJdyv2fPfavlWxI8qVnQj21iZlMgw7zZ/NS0HxqxrI
         jBKgXTSeMgtuiI9873OXAjzZaPJ8Eu8p47qtsFV410jKfv6FH1774FCaDCqATfxzXWgJ
         /StBRnFZ4bX2IFs1OEFlvXDJ5iZ+hIJXxuLnlEQ+uvcYuGblHW6f3RNhphUq9j7C87ek
         4qQeSapqDtu3eJCYM6v3mkGKJSR29aJeW8LWUj2HiThRoKq9sjFmBoQMoGkDhp1PXEFU
         Gt3ju19VvR0iMTOluQX44cvPOM4GCrcZ5YSU76JODIx8Feh7EXHec1jcRzjz+Incciyg
         CuiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760113743; x=1760718543;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=I3U3z+MxtHRc1TbZfMT65//LhXVgyA4kIa04lLEyNEQ=;
        b=mKNA+POI7lTfQz3Nq3G2X62JLhdh1TneT5/gSdO74J6Lp/7EhcPGiKU/vl+/K+hu57
         nAvtXwdmKLw/D13IrTFXYsiJdACEapgFbRGD93/3IsEu5xzlGl2omlyFfRwFhjX3D3tI
         BlcNAQpwvhabIZqSpMMhYZp7aBzJUsp9nUYQVp6h/wPDK0mWHrGiSy6KJAJxJ9uwulRR
         8AIgT/MPVaL50G9Wa/Wv39l5bUhgbOn6vURJVHViO+voOX+A4kyNycVL4a7SOrwgB1rK
         i2nvAlLkQOc6ACFD4hIq4bjOdP+SwfYoaszWB7EDr5qKwZvf6k9Ji19BdGbDI33EIE29
         n34Q==
X-Gm-Message-State: AOJu0YwVrkpDZdFB/pXh+Qpt/TrFTVdroYQOF3eaBZPT+OExj09z+9pO
	cBbV1ioT0YoePDddZ5NyCeoPFFV/iiV6ngYToKoUemZ9BTMwhXUiGJncyGiKS/fK6p4xIEEquhF
	8OBU9
X-Gm-Gg: ASbGncvPm5X3VpDwvHp7pxSYiww1MK8rozGIzqWsha2K6Bj5c719mMkz+fe9E+CpYCq
	9ObEQpr+TH/z2WZD3zI8W9zYeOtil2Jkm33n0ur9wUs9BsrOycl0lK/TC3DdhWtZsKFSFFK+jKG
	KIt48f070sKdWn7DvKqWAW9W0PzET+Tw0KNJzaaiNt7KVH5WA3YhfRkDLDRk74CNhFHqBOsUAqR
	Khz2IrUXVpbFPuHlDIG1nQGNVFI6NiSvIcgHAHNjmB0IolK7zxWmEu6Y7nU1PVJfTOO4Gr5rNyU
	/P790bBGpdRA+5y17NhcAwLckPYiL7eBF1qIox7EF88nl8ICE3+41RaJtx9Y5b//eExR7RUGBlk
	bBWMit6z3AkssCsgfbYbkdZcMWd9RycuejjV8UnA6a05yPJ6wwpPah6+i
X-Google-Smtp-Source: AGHT+IFR6y340bMSWELEhcR6RcVIFxm7YfjU1sFWnhIntD4KNdEbVaFNQR+b1N7uyKt9l3WcEuALMQ==
X-Received: by 2002:a05:6402:1ecd:b0:63a:38e:1ddb with SMTP id 4fb4d7f45d1cf-63a038e4c9amr4831572a12.4.1760113742713;
        Fri, 10 Oct 2025 09:29:02 -0700 (PDT)
Received: from draig.lan ([185.126.160.19])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-63a52b1de3esm2602007a12.18.2025.10.10.09.28.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Oct 2025 09:28:59 -0700 (PDT)
Received: from draig.lan (localhost [IPv6:::1])
	by draig.lan (Postfix) with ESMTP id 7385F5FA1B;
	Fri, 10 Oct 2025 17:28:58 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: virtio-comment@lists.linux.dev
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Robin Cover <robin@oasis-open.org>
Subject: [PATCH v3 01/11] LICENSE.md: convert html to proper MarkDown
Date: Fri, 10 Oct 2025 17:28:48 +0100
Message-ID: <20251010162858.4107388-2-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251010162858.4107388-1-alex.bennee@linaro.org>
References: <20251010162858.4107388-1-alex.bennee@linaro.org>
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

There is no point embedding HTML inside the markdown document. It just
makes it messy to edit. The boilerplate text is maintained.

Cc: Robin Cover <robin@oasis-open.org>
Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
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

