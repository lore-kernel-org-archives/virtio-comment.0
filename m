Return-Path: <virtio-comment-return-8996-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D936C47258
	for <virtio-comment@archiver.kernel.org>; Tue, 23 Jan 2024 05:07:10 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id C23551A98C6
	for <virtio-comment@archiver.kernel.org>; Tue, 23 Jan 2024 05:07:05 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 0B8AF98680E
	for <virtio-comment@archiver.kernel.org>; Tue, 23 Jan 2024 05:07:05 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id CC5FC9868D3; Tue, 23 Jan 2024 05:07:04 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 8AF48986827
	for <virtio-comment@lists.oasis-open.org>; Tue, 23 Jan 2024 05:07:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705986422; x=1706591222;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ayRvHEh7mgSNcAAr26gWZrkEBxtXkBw7EmuPmau9IhU=;
        b=H5Zzdu9KbIrzBjRtGcjcxHLYzgORV9J+22+UhY3tRV42hnLqGQ5swub+s00+e4fMy5
         T0gdwwOoEnsxu4ZXTyTUM13roIu9bQe1RFHgNxIuFaUbJa37wEX1deQCAwsGybnTuWyu
         9RehuYMN4cqpSnlBUXfVNKL4lQ1BpLlVIz1xWHgvleHWCeD6Tw/0Q+tBAUi3j7Ln34Z7
         V785xaw+7e3blB0hn7VzHhO5d83pvvfeW3VgDFiBdRtUQHsTpvqyjU5+4OWn8Xi5fOFl
         gbkH4QernC8rYKKdlB/tkcDAmJSxmkpD5HfNTMreelD19msFeI5a/yh1h46HvAvRxj2u
         uwvA==
X-Gm-Message-State: AOJu0Yw3fkT/2kcuFZm2CMREiC2pLpjMyW4gNVNUZUN0NqiUlFY3ByKl
	woQnGFkE4nx4dHc8UeAxr0Z+XIH3VPHYHej1t3NPMbsYNjMNBOL5vDg422aSowqXMYIM3RSPgyK
	vQtosof1DZ+g8fODFTkQl5/4+mDXTPuEWKtq8Obzl7ld1IfcZma3R
X-Google-Smtp-Source: AGHT+IEAT9kxXFLH/wFEsmf4yZPjEsXU0SwDPSqTExhtExd8ujZXIVepz9NKe19wOuKv9LQMd/+CxZ1vohe0RoMr8xE=
X-Received: by 2002:a17:907:d411:b0:a30:49d6:5abf with SMTP id
 vi17-20020a170907d41100b00a3049d65abfmr2757270ejc.37.1705986422077; Mon, 22
 Jan 2024 21:07:02 -0800 (PST)
MIME-Version: 1.0
From: Shujun Xue <shujunxue@google.com>
Date: Mon, 22 Jan 2024 21:06:51 -0800
Message-ID: <CAB6OiKiRAFTXxGExz26ww9P-wEx-26HR+u_-XM=xw-PpVywxfQ@mail.gmail.com>
To: virtio-dev@lists.oasis-open.org, virtio-comment@lists.oasis-open.org
Cc: mst@redhat.com, Slava Malyugin <slavamn@google.com>
Content-Type: multipart/alternative; boundary="000000000000ae931c060f95ea4d"
Subject: [virtio-comment] [PATCH] Define the DEVICE ID of Virtio Cpu balloon device as 47

--000000000000ae931c060f95ea4d
Content-Type: text/plain; charset="UTF-8"

The virtio CPU balloon device is a primitive device for managing guest
CPU capacity: the device asks for certain CPU cores to be online,
offlined or throttled, and the driver performs the requested operation.
This allows the guest to adapt to changes in allowance of underlying CPU
capacity.

Signed-off-by: Shujun Xue <shujunxue@google.com>
---
 content.tex | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/content.tex b/content.tex
index 0a62dce..6149612 100644
--- a/content.tex
+++ b/content.tex
@@ -739,6 +739,8 @@ \chapter{Device Types}\label{sec:Device Types}
 \hline
 45         &   SPI master \\
 \hline
+47         &   Cpu balloon device \\
+\hline
 \end{tabular}

 Some of the devices above are unspecified by this document,
--
2.43.0.429.g432eaa2c6b-goog

--000000000000ae931c060f95ea4d
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">The virtio CPU balloon device is a primitive device for ma=
naging guest<br>CPU capacity: the device asks for certain CPU cores to be o=
nline,<br>offlined or throttled, and the driver performs the requested oper=
ation.<br>This allows the guest to adapt to changes in allowance of underly=
ing CPU<br>capacity.<br><br>Signed-off-by: Shujun Xue &lt;<a href=3D"mailto=
:shujunxue@google.com" target=3D"_blank">shujunxue@google.com</a>&gt;<br>--=
-<br>=C2=A0content.tex | 2 ++<br>=C2=A01 file changed, 2 insertions(+)<br><=
br>diff --git a/content.tex b/content.tex<br>index 0a62dce..6149612 100644<=
br>--- a/content.tex<br>+++ b/content.tex<br>@@ -739,6 +739,8 @@ \chapter{D=
evice Types}\label{sec:Device Types}<br>=C2=A0\hline<br>=C2=A045=C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0&amp;=C2=A0 =C2=A0SPI master \\<br>=C2=A0\hline<br>=
+47=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&amp;=C2=A0 =C2=A0Cpu balloon device \=
\<br>+\hline<br>=C2=A0\end{tabular}<br><br>=C2=A0Some of the devices above =
are unspecified by this document,<font color=3D"#888888"><br>--<br>2.43.0.4=
29.g432eaa2c6b-goog<br></font></div>

--000000000000ae931c060f95ea4d--
