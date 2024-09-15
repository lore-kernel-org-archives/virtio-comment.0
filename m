Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 599E22232A
	for <virtio-comment@lists.linux.dev>; Sun, 15 Sep 2024 07:56:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726387002; cv=none; b=tQfpoTEwpQYx7DmWh4KnHAFYck9EDK4oAp++YUvMo7ClUDVZ6pEbb4zI5bvAZ7+yq85mCJ1KeDEkEX+mdePFQlpjPxr2gVNzkL/52UdP/QZXBchp5eB99bQ7B7Ai0jlQYUok+CUrLCfrWeaPCatyr6HK+0CCLnRxB9HRHkEJ9FU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726387002; c=relaxed/simple;
	bh=LMVlf91MIyu6X5Jf/Hk4+UBT2THCH82dK/P32UOrW3Q=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=KzkVoXF3qDid33p1uuyxVK77RKpH2X+bCXwbD7SsJB0pOL6e/fdsNx8vZABHZ0550WphOsDgFikIBH1xYt71YuipPaO+y3DoI/Cz+88oqW8TJoRSQqysiMCc1TyfKMSfAvxQ3megtAcehJYt5xojkYOejbGa2dCyNAHCNVtdQg0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=JQGkSJwQ; arc=none smtp.client-ip=209.85.208.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="JQGkSJwQ"
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-5c260b19f71so3868658a12.1
        for <virtio-comment@lists.linux.dev>; Sun, 15 Sep 2024 00:56:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1726386998; x=1726991798; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=JVa1p4o/YK0cQ4iMEyZg2Yb3UsDpnrrnKJHdPz7VX8A=;
        b=JQGkSJwQPShS0tNbZbWIgqtF/4fyVjdYQN0ALyrje3TaQSv+F8t0NrFYaWshsfwTr5
         pBXjxg6F1O8zZ7ZThIGzYI8/u6eZ/JPvQKHzoNDL0F1YCuwjXUMYz0wNvRSlelT6AlrB
         jxPVceuTqVaz5GF6TXdB5rIMdeXCYOALvq+sf8WtAr+0iiXgRM96aPsP1IpQ9S0VIMsK
         OR/6z7tD7gCDdIx8ftvkmMyJI6S9GLhHPzj+LBz7SnhctJmuCJzg5jY1JhpVza3aZOoq
         VMm+GAx1qs6kqjnxY2WB3W58nhT8BnOGwoY7pOdOkCsPUyZf5eW/Ypur0R6hxlaooD8W
         VPFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726386998; x=1726991798;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JVa1p4o/YK0cQ4iMEyZg2Yb3UsDpnrrnKJHdPz7VX8A=;
        b=wlIfdiA0rO3GYxjUqGpbxbVi29k4E57w8cvq2EDdb+wCi5K3s/LDlG00OjmE+9dwfE
         +H9Fi3fpmDSh1NoJJE++mEkdJUZ5rdysh9iFoxbI7Kx3ktvtmOaQTDT1slaiRxhAst4+
         khVa91fmnL5VD8DrJg4WpZr1mdvbXFoyfcoszm70pgD4SFCIF/3G3LT/SI+g47mojb5R
         4TS0dlag7tWVwYA8TbZy96dWyEkSDVxoUOo+aGCszLU1Jm8wMeBwanFf5FCHHkbC2j52
         rSqNqVOXftyU7IaWVrLRBL2VAwCtLv/qG+mADPp2xT/8SRISDo4c/Y2QxtdIjkbygXCE
         b50w==
X-Gm-Message-State: AOJu0YyQTPXnZpgq5r0Wp9mjxmzPGg777A5JK0IDmqPJiZEdPxhBTN7R
	X4yXWsxAYR+o8EWWMXlFTW6PozhFPeeKY5VyT3eySxL0pMWkZofeAE/xBRfBeJRZNH4kZkmPxPi
	F8Fg=
X-Google-Smtp-Source: AGHT+IHmJWGM7xrDGTAVkc216bxHHApDUAWcEC7ahtBYtpkfIcULRKtiTNBv7onR7od4X84RXcS/fg==
X-Received: by 2002:a05:6402:13cb:b0:5c3:c3f5:592e with SMTP id 4fb4d7f45d1cf-5c413e12400mr10444853a12.12.1726386997498;
        Sun, 15 Sep 2024 00:56:37 -0700 (PDT)
Received: from localhost.localdomain (adsl-13.37.6.161.tellas.gr. [37.6.161.13])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5c42bc88d82sm1410309a12.81.2024.09.15.00.56.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Sep 2024 00:56:37 -0700 (PDT)
From: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>
To: virtio-comment@lists.linux.dev
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [RFC PATCH v1 0/2] Embed files as PDF attachments
Date: Sun, 15 Sep 2024 10:56:29 +0300
Message-ID: <v1-proposal-attachfiles.manos.pitsidianakis@linaro.org>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF8
Content-Transfer-Encoding: 8bit

The PDF specs allow for file attachments to documents. This can be used 
to make the VIRTIO PDF spec a single source of truth by embedding 
related files.

This series attaches the virtio-queue.h header file as a proof of 
concept. It can be inspected and extracted using a compliant PDF viewer 
such as Adobe's or Firefox's integrated PDF reader.

(Note: I'm not sure if Chrome supports it, my local version does not, 
neither does Chromium.)

Programmatically extracting files is also possible, allowing for 
downstream projects to update their headers by accessing the upstream 
pdf file.

Example using the `pdfdetach` utility from the Xpdf package of tools 
(`poppler-utils` package on debian/ubuntu):

  $ pdfdetach -list virtio-v1.3-csd01.pdf
  1 embedded files
  1: virtio-queue.h
  $ pdfdetach -save 1 virtio-v1.3-csd01.pdf
  $ file virtio-queue.h
  virtio-queue.h: C source, ASCII text

Manos Pitsidianakis (2):
  specvars.tex: Add \virtioauthor command
  Embed virtio-queue.h as PDF attachment

 commands-html.tex |  7 +++++++
 commands-pdf.tex  | 10 ++++++++++
 headerfile.tex    |  2 ++
 specvars.tex      |  3 ++-
 virtio.tex        |  1 +
 5 files changed, 22 insertions(+), 1 deletion(-)


base-commit: b495841a8e80d12c1130f8868f4128866291142d
-- 
γαῖα πυρί μιχθήτω

