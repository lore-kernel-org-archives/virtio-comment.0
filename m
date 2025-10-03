Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD4782C21C7
	for <virtio-comment@lists.linux.dev>; Fri,  3 Oct 2025 17:19:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759511971; cv=none; b=cLeoBTEX67xlku4KtEj0aEN7uRJgjuDTH+r6/1G0lZx+i5/Te28osUNMwVkKRYg2DggHgvRoncfPiRUSldbjn8rQEsa0auqct6DD6gnLyt2Szp9N/1/oYbD3eC/Xx6JBBuk+5Avkx0vGLVpO3ipvVCdjkqfrGlQoIntjbEpWTAY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759511971; c=relaxed/simple;
	bh=gE18HPQaG0VXP2H5ApsErrjALrdFcjXqblT6zy8y8RM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=PVUiNBJFaKP41ZMcglcv9CAKJnJPEoOEriyjA5K2G7EybBBiC/VnYhPGZ1V9nu0vjju6O2AoPvQj1WQsmut6KugE1rzm6RZahwFBncXE8cZUCzbMWPufXoHZbLdr6apY4PVM7MQ+MNzZM8hEttldnYIqDdDAhp1xmnGjkdfzbGM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=K/PGZIdt; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="K/PGZIdt"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-46e504975dbso15731945e9.1
        for <virtio-comment@lists.linux.dev>; Fri, 03 Oct 2025 10:19:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1759511967; x=1760116767; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:user-agent
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=T+NYkbJH96LXjBfIlTbfpE4wlh9+bIwKB71LVrpg94E=;
        b=K/PGZIdt2Gf6uIg4PIQGRDVnOKDg0tr5w2Dncs14I91oPHm81/+owFkks3ax6LWB8+
         V/jcuj12CPED4DZ4y+orEVAXSQnP0WgG1TABnXnZ9t7otmOy90fhhMovc/eonuZ8v0qQ
         FSiIH+njJaN8vrrCZ+2ATBbK92VODZ4IEjWR1bnUmP+NeMb3/hNdRRmGfiNxSQD4dpU7
         l350vXjdzWpVdbI6XHlR/rr1P2tZONyq7XSY0E6AKV7zTZAPkGfMNSzr7yKd84k0gUcM
         I73aNED01oicZA3LbhQubV4TLBpBNvq6A8qIvSFA5FnHcgCb2UJFiACa4I8pmK2vqjrR
         4HWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759511967; x=1760116767;
        h=content-transfer-encoding:mime-version:message-id:date:user-agent
         :subject:cc:to:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=T+NYkbJH96LXjBfIlTbfpE4wlh9+bIwKB71LVrpg94E=;
        b=rtZRPmhwLCt6EJ5Sazd7aCkV9dAd6gxhAnVN9JSIbYU1XsHRiA4B8MYwxiulJBdzqd
         uAI4QFjmIfB05Dbs6oBed+EMiYxDwtuyCgwQnM3Q8VAHBuc8CiHmFQHhzII4YGFEh4Yh
         wRM4AwbRSXw2HGPnnmS3VULmWCN1OKOBl2RaB6U6aB57L3jyZknudGf0jF4b7VqJgrul
         fOzr+HPhVrsdK51tB/fU1DCWOgTqtxdzmMr2wZgnVnGCdUu8Cs2l2+TGUDp6xa6XVgGD
         zIpcqThA5d6i+Lx5tSIQDbwUaiSv4o0t6uGWkNnwQrTJaHAet/jw4wK9BQaZv96UmRB1
         WVpw==
X-Gm-Message-State: AOJu0YxUpM50VIf37prvwqgoZ9Ldsufz6Pb+y1eFKBfoJq6gTg6MnmnV
	TEnOXqcLyE84g5VB3Wp3bsbGpou0nGJRcL3AvLmADBiow5tN6Lfbty7KvUK/yEqwvKp60ZvIznk
	OVqtO
X-Gm-Gg: ASbGncuIy5Xa4Ujs9SdADb1GOUEwIYa2MQCdyvigRL9UFWwVxx9LTOm2nxnwJCUynSh
	6BFTUdeulG7bE8UxjOZeurWhWgE6N1caARgh6Xa31FotlXkqy/FrJAlwaD9GpXjynxwetNSdmiD
	E6An58xyavOf6ynMtvQUweTWOXsHk0s6SUssRkdgo4Tqjy3v7rEMW4gaCtqoryGMlkUJ4G00UbI
	usbjYQcFIGVnxTcZv30pnB8D6cbeDE6UNYP4mpEGTq9FmKAoyw4stjBJiNGd7S077g1c3WI1NvE
	Kqr68HRZGCIlK2Kj/qcFzDPGVQkErgE2NBRVGTqJWSg1cpYIYniPu5ocYgcrCRSs71Hulgd7nAC
	0uYKR1dWrsA1ClFFlbAEIhGTNj5CKfNNZWPRdnlz03wPAoHXu/JI=
X-Google-Smtp-Source: AGHT+IFAD1qW/94pnWvUFvwudkusdBSZ+p/AiIj2yPxYohH7vh4G5/OpYnrXeU6HcuWNaGTO1ff4jQ==
X-Received: by 2002:a05:600c:64c7:b0:46e:1c16:7f42 with SMTP id 5b1f17b1804b1-46e7112437cmr25607725e9.11.1759511967314;
        Fri, 03 Oct 2025 10:19:27 -0700 (PDT)
Received: from draig.lan ([185.126.160.19])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-46e72362344sm41009915e9.15.2025.10.03.10.19.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Oct 2025 10:19:26 -0700 (PDT)
Received: from draig (localhost [IPv6:::1])
	by draig.lan (Postfix) with ESMTP id 739325F7D9;
	Fri, 03 Oct 2025 18:19:25 +0100 (BST)
From: =?utf-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>
To: tex-live@tug.org
Cc: virtio-comment@lists.linux.dev
Subject: VirtIO html render failure using htlatex
User-Agent: mu4e 1.12.14-dev1; emacs 30.1
Date: Fri, 03 Oct 2025 18:19:25 +0100
Message-ID: <87frbzgaxu.fsf@draig.linaro.org>
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable


Hi,

I was attempting to re-build the VirtIO specifications since upgrading
my main machine to Debian Trixie. The build fails to complete with:

  ! Undefined control sequence.
  \f:HBorder ...border-top:1px solid \#\hline:color=20
                                                    ;"></td>
  l.867 R
         ead / Write & Device Specific & \\
  ?=20
  ! Emergency stop.
  \f:HBorder ...border-top:1px solid \#\hline:color=20

The final result is an empty html file. I verified this was a regression
by running the same build on Bookworm using distrobox. It also works
with the latest Ubuntu. I confirmed it fails on the latest=20
texlive image:

  =F0=9F=93=A6[alex@texlive virtio-spec.git]> htlatex --version
  This is pdfTeX, Version 3.141592653-2.6-1.40.28 (TeX Live 2025) (preloade=
d format=3Dlatex)

I've created a minimal test case that triggers the problem:

--8<---------------cut here---------------start------------->8---
\documentclass{article}
\usepackage{hhline}
\begin{document}
\begin{tabular}{ |l||l|l| }
\hline
Bits & Device Specific & Purpose \\
\cline{1-2}
Read / Write & Device Specific & \\
\cline{1-2}
Purpose & Device Specific & \\
\hline
\end{tabular}
\end{document}
--8<---------------cut here---------------end--------------->8---

save as test.tex and run:

  htlatex test.tex

I'm aware make4ht is an alternative which fails with a slightly
different set of errors:

  =F0=9F=93=A6[alex@texlive virtio-spec.git]> make4ht test.tex "html5"
  [STATUS]  make4ht: Conversion started
  [STATUS]  make4ht: Input file: test.tex
  [ERROR]   htlatex: Compilation errors in the htlatex run
  [ERROR]   htlatex: Filename     Line    Message
  [ERROR]   htlatex: ./test.tex   ?        Undefined control sequence.
  [STATUS]  htlatex:  <- ;"></td> l.8 R ead / Write & Device Specific & \\ =
The control sequence at the end of the top line
  [ERROR]   htlatex: ./test.tex   ?        Undefined control sequence.
  [STATUS]  htlatex:  <- ;"></td> l.8 R ead / Write & Device Specific & \\ =
The control sequence at the end of the top line
  [ERROR]   htlatex: ./test.tex   ?        Undefined control sequence.
  [STATUS]  htlatex:  <- ;"></td> l.10 P urpose & Device Specific & \\ The =
control sequence at the end of the top line
  [ERROR]   htlatex: ./test.tex   ?        Undefined control sequence.
  [STATUS]  htlatex:  <- ;"></td> l.10 P urpose & Device Specific & \\ The =
control sequence at the end of the top line
  [ERROR]   htlatex: Compilation errors in the htlatex run
  [ERROR]   htlatex: Filename     Line    Message
  [ERROR]   htlatex: ./test.tex   ?        Undefined control sequence.
  [STATUS]  htlatex:  <- ;"></td> l.8 R ead / Write & Device Specific & \\ =
The control sequence at the end of the top line
  [ERROR]   htlatex: ./test.tex   ?        Undefined control sequence.
  [STATUS]  htlatex:  <- ;"></td> l.8 R ead / Write & Device Specific & \\ =
The control sequence at the end of the top line
  [ERROR]   htlatex: ./test.tex   ?        Undefined control sequence.
  [STATUS]  htlatex:  <- ;"></td> l.10 P urpose & Device Specific & \\ The =
control sequence at the end of the top line
  [ERROR]   htlatex: ./test.tex   ?        Undefined control sequence.
  [STATUS]  htlatex:  <- ;"></td> l.10 P urpose & Device Specific & \\ The =
control sequence at the end of the top line
  [ERROR]   htlatex: Compilation errors in the htlatex run
  [ERROR]   htlatex: Filename     Line    Message
  [ERROR]   htlatex: ./test.tex   ?        Undefined control sequence.
  [STATUS]  htlatex:  <- ;"></td> l.8 R ead / Write & Device Specific & \\ =
The control sequence at the end of the top line
  [ERROR]   htlatex: ./test.tex   ?        Undefined control sequence.
  [STATUS]  htlatex:  <- ;"></td> l.8 R ead / Write & Device Specific & \\ =
The control sequence at the end of the top line
  [ERROR]   htlatex: ./test.tex   ?        Undefined control sequence.
  [STATUS]  htlatex:  <- ;"></td> l.10 P urpose & Device Specific & \\ The =
control sequence at the end of the top line
  [ERROR]   htlatex: ./test.tex   ?        Undefined control sequence.
  [STATUS]  htlatex:  <- ;"></td> l.10 P urpose & Device Specific & \\ The =
control sequence at the end of the top line
  [STATUS]  make4ht: Conversion finished

Running the same command on Debian Bookworm yields:

  =F0=9F=93=A6[alex@debian-bookworm virtio-spec.git]> make4ht test.tex "htm=
l5"
  [STATUS]  make4ht: Conversion started
  [STATUS]  make4ht: Input file: test.tex
  [STATUS]  make4ht: Conversion finished

For references the working versions are:

  =F0=9F=93=A6[alex@debian-bookworm virtio-spec.git]> make4ht --version
  make4ht version v0.3l
  =F0=9F=93=A6[alex@debian-bookworm virtio-spec.git]> htlatex --version
  This is pdfTeX, Version 3.141592653-2.6-1.40.24 (TeX Live 2022/Debian) (p=
reloaded format=3Dlatex)

Any suggestions?

Thanks,

--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro
