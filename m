Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DEAC1EA85
	for <virtio-comment@lists.linux.dev>; Thu, 11 Jul 2024 19:15:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720725354; cv=none; b=Ca2xjNz7ma4OnX5fEAyG53nkPGo/+bj/HYPeUsqxaOZ4QtFSZSM8GLYsK3v73gIb9uhXwhI29ZR1hUIDdkhj7HDX8jZ+zORufZn+eRLMrbiDPIPsATB2pIN6x8NiqXkMvgF05fdMNDb3ZxGlotEP6hlf46IHyrN4jO5LS6Qr+jc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720725354; c=relaxed/simple;
	bh=L32XmzA6VsoK62phDBiMZlsY3LXGLNDRRByCyyju1xQ=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=awvQJreDzwJwTWrWZyfP0eXHuAZhacBZq2E+pe+HCSwQdAULaKjFwEqkUEyqwofaGMxAP+DqTYkFC/C+s3FTIPDgzuMi0LbasMFd7I+EnTE4C8sgX95RcHQ23XMNzf2NIRIw5lwzLK/LQdLje6CBJr3bHHKDd3Oj+WMQ2rDVLwM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=hiLkWT3E; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="hiLkWT3E"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1720725352;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type;
	bh=MBzv+sApGyHCZY1I7kkGt1UuZBbldcromQcQAocploc=;
	b=hiLkWT3EAJ7RLlVhICPc7EaypA5Fl68oY50hDn5cO1l2PeL8QK+d9gSp7uxySSwROLbY1+
	RdWsw1qTwwmX98PY79Hij1ydvORogxFqXFqEU+R+Qnr8N9vTHEqYmGMheP1idkgrPhJo4y
	GUSL862WpB/Lol26meFwCiSn4aGgd0w=
Received: from mail-lj1-f198.google.com (mail-lj1-f198.google.com
 [209.85.208.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-616-oL4P_M-jP0ajK38oW66N2w-1; Thu, 11 Jul 2024 15:15:43 -0400
X-MC-Unique: oL4P_M-jP0ajK38oW66N2w-1
Received: by mail-lj1-f198.google.com with SMTP id 38308e7fff4ca-2ee81ff717fso13262401fa.3
        for <virtio-comment@lists.linux.dev>; Thu, 11 Jul 2024 12:15:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720725342; x=1721330142;
        h=content-disposition:mime-version:message-id:subject:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=MBzv+sApGyHCZY1I7kkGt1UuZBbldcromQcQAocploc=;
        b=khksQ1j1O3YyB+ZGbmV9HsoZW4sz3k5ItAl1afobhZNm+k6JRhK1Vn1jj4V1NtWY+T
         c/cpFDvG85Wwk/5mSfuae5x+ONdoN2IhrOpZyNQh+kDXYRcsrqEGCQRbOFiSrHvQFsXC
         IghKrtFwQfuglMvns56qi4TANYO6naPbB4Kjt1GDQnQM0fNd+NXtO+8Tt7l7drYf1Ln/
         r2kN8j2nvES/ray+ZLx111b50YgWtdV/BiGWUbUDHhysp172AtTIWRuqYMAXkJCj/N/w
         CDT3LqdhLirJHfa600ptKgr0qHWUFOj3nqH0RpgspIhW++wSVtVQoAsEYNWZDR7olWxq
         p+/A==
X-Gm-Message-State: AOJu0YzhsYS8g1oES+BEeM/+OouGotvVkop7HzWtFHcLFw4z9Kf/5ujk
	3XfJsv3q46xSuPuQ19RqLwHyhVuIW54tbIIvYD8/+No9+R0tDdfwu/jRI8nKtstGXfh/Owu1wVG
	8loBjH175KI7SRrVYNlbfpd2zpUwfJm09w8Gfu97nh9Q0xqcSHebt6Q24Qhju6SpslskJCN1axp
	7g2M7SzELJurBb5Zjj8mlHcW87gCiEtlIwbz1wuUtdaA==
X-Received: by 2002:a2e:9d01:0:b0:2ee:893e:4efc with SMTP id 38308e7fff4ca-2eeb30b9a4emr77384681fa.10.1720725341969;
        Thu, 11 Jul 2024 12:15:41 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH5/UCN5Fh4fbzOkDY298fL9M0RGIULDx6TgQi26ok9JrC1X8gaEjYNug3al1h/EZBvDc6fZg==
X-Received: by 2002:a2e:9d01:0:b0:2ee:893e:4efc with SMTP id 38308e7fff4ca-2eeb30b9a4emr77384411fa.10.1720725341138;
        Thu, 11 Jul 2024 12:15:41 -0700 (PDT)
Received: from redhat.com ([2a02:14f:173:2166:83a4:d566:a055:a5a3])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4266f7416bcsm128184335e9.43.2024.07.11.12.15.40
        for <virtio-comment@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Jul 2024 12:15:40 -0700 (PDT)
Date: Thu, 11 Jul 2024 15:15:38 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: virtio-comment@lists.linux.dev
Subject: [PATCH] introduction: fix label
Message-ID: <52b6fc16793e3b24284aefafda94322c739b9f7f.1720725332.git.mst@redhat.com>
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

label to rfc8174 is incorrect, leading to undefined reference
and multiple defined reference latex errors.

Fix it up.

Fixes: eb16e33 ("editorial: various fixes for 1.3-csd01")
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 introduction.tex | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/introduction.tex b/introduction.tex
index cfa6633..44c4ca4 100644
--- a/introduction.tex
+++ b/introduction.tex
@@ -141,7 +141,7 @@ \section{Normative References}\label{sec:Normative References}
 	\phantomsection\label{intro:TCP}\textbf{[TCP]} &
     TRANSMISSION CONTROL PROTOCOL
 	\newline\url{https://www.rfc-editor.org/rfc/rfc793}\\
-	\phantomsection\label{intro:rfc2119}\textbf{[RFC8174]} &
+	\phantomsection\label{intro:rfc8174}\textbf{[RFC8174]} &
     Leiba, B., "Ambiguity of Uppercase vs Lowercase in RFC 2119 Key Words", BCP
     14, RFC 8174, DOI 10.17487/RFC8174, May 2017
         \newline\url{http://www.ietf.org/rfc/rfc8174.txt}\\
-- 
MST

