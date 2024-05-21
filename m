Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F160F143890
	for <virtio-comment@lists.linux.dev>; Tue, 21 May 2024 15:13:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716304411; cv=none; b=ElwhFlm3iM4VMgzdA+3oMek21J+G8lb66Eizvfs4L0Ttt6fk3xvctDkrMtV0VQ8gVYnXqp9UlzJDjoMRAEI7vgB9zzXd5HKymbGv19ddwoEgXOWGK5SWpxAFTv0hULxL6URfXe2SpSC07KkYGlwA+HSJv5AtD3UrFw1q9OmE5vY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716304411; c=relaxed/simple;
	bh=XpFS7AoLDpCZcQloxZRXFAgIi+7ZZ7ho5hElXEre9wk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=g/I6OZRIRVIOSNKCeaE2rwMclfAnLYG2i3yz7xE+uVtechNws3GQ7Xsui5VZM7/OAe0NydDzqdj3B4w/XiagGHVh12rR7Cah1Q80tPn9zdoglwMk3SCSeRochcOKtzA2OnKTo5QgdMWRT5i8PDr/umkxH9o8IpbzGi+SGWM+GDc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=hbJxT8HI; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="hbJxT8HI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1716304408;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type;
	bh=Jtw/Pen4U2ZFXE8zotdoYuJqCnMON9/q4K36vHBkdvY=;
	b=hbJxT8HIg3ENcAWJyJX0MlWmu+6Bk0GCIE5Qt6YmX7oTshkMKr+6459UbzMnPhTQOgn84u
	8qMhxxeLKGIjJO12SHeNKZF427C9N4FoJ+yO/XTgU8uGsHgvC/9TBoPh4jfEUjkW7D7qV7
	nPbKO0JeXwC8CHK69sP42gz021sLis0=
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-524-unxEYdBZO1CNQ3o0BlklYw-1; Tue, 21 May 2024 11:13:27 -0400
X-MC-Unique: unxEYdBZO1CNQ3o0BlklYw-1
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-43e4454be9fso54331591cf.0
        for <virtio-comment@lists.linux.dev>; Tue, 21 May 2024 08:13:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716304402; x=1716909202;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Jtw/Pen4U2ZFXE8zotdoYuJqCnMON9/q4K36vHBkdvY=;
        b=OIdlZJLViIL3svt0qFYG/dpEADpDf3xCw+HZCn1DCW7JnDIad2UO8KxijW6iabfUy4
         3frLxl7nf5218N3ugg8CgaNrVb/WmktrGmv21BhoOqYPmSVXuUUNcoUrPHTifaM0Yie+
         ggoDqT7ud74QG3qv0sHFkoNl1bdYGMoSlpNd+s69KZcgjRzE7G2EeIBU/D1X5v0ZifIq
         FcP0wJNoWyGa+HlC/gxWvn9DnFIVXFsfEtlzZvWy2Y07cwMRwasTu5UkWIkryx7iYxqp
         xKNmFU0OYwkLK0UIhhPCrJD43CxD5Of8SkqN93m3G+e3o86zX6iKYuCDEY7Air/Orj6l
         3sfg==
X-Gm-Message-State: AOJu0YzznuD+PUEYxPkHlBioSy8AwWZth9YbcH8cJnpOvifVLIYV15Qk
	+M2ijlcUVPiS2EOjULpBwKLTTTRitanGb0BjAhDk++oD9qh52ujkdA8SE9IK/m6OT2UKGTLTPNl
	O67PhYIXC0uE6z+IShLfSDvwBzSD/2dl9Zp8aZNxkUQg5X6OYm0UbKMJ6H/cwwuSh2UVBo5vCtG
	2Uq5epZ85flYIYmEvpZPRlNu+KVXDnVW7C03Wb2CaLSrCzuem9XQw=
X-Received: by 2002:a05:622a:1982:b0:43a:ffb9:6c65 with SMTP id d75a77b69052e-43dfd9a930dmr392292691cf.0.1716304402026;
        Tue, 21 May 2024 08:13:22 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHRY4dyIEtjYQyvBD5DOkBTjuN4f4RjzEScJWRVyexLCGbeAvu/bGL9fHcswwyMBdswzoeYQw==
X-Received: by 2002:a05:622a:1982:b0:43a:ffb9:6c65 with SMTP id d75a77b69052e-43dfd9a930dmr392292421cf.0.1716304401595;
        Tue, 21 May 2024 08:13:21 -0700 (PDT)
Received: from fedora (lmontsouris-659-1-55-176.w193-248.abo.wanadoo.fr. [193.248.58.176])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-43df97d2c3csm156095101cf.78.2024.05.21.08.13.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 May 2024 08:13:21 -0700 (PDT)
Date: Tue, 21 May 2024 17:13:18 +0200
From: Matias Ezequiel Vara Larsen <mvaralar@redhat.com>
To: virtio-comment@lists.linux.dev
Cc: anton.yakovlev@opensynergy.com, mvaralar@redhat.com
Subject: [PATCH Resend] virtio-snd: improve PCM command lifecycle description
Message-ID: <Zky6Disx1ofmETmn@fedora>
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

The PCM command lifecycle can be described as a state-machine in which
the switching between states is triggered by commands. This commit
explicitly presents the different states and the commands that are
allowed in a given state. This commit leaves to the implementation the
decision the state reached depending on the command.

Signed-off-by: Matias Ezequiel Vara Larsen <mvaralar@redhat.com>
---
 device-types/sound/description.tex | 26 +++++++++++++++++++-------
 1 file changed, 19 insertions(+), 7 deletions(-)

diff --git a/device-types/sound/description.tex b/device-types/sound/description.tex
index 54c9c8e..55e93af 100644
--- a/device-types/sound/description.tex
+++ b/device-types/sound/description.tex
@@ -397,9 +397,21 @@ \subsubsection{PCM Control Messages}\label{sec:Device Types / Sound Device / Dev
 \item[\field{stream_id}] specifies a PCM stream identifier from 0 to \field{streams} - 1.
 \end{description}
 
-\paragraph{PCM Command Lifecycle}
+\paragraph{PCM Command Lifecycle State Machine}
 
-A PCM stream has the following command lifecycle:
+A PCM stream can be represented by a state-machine made up of the following
+states:
+\begin{description}
+\item SET PARAMETERS
+\item PREPARE
+\item START
+\item STOP
+\item RELEASE
+\end{description}
+
+A command triggers the transition between these states. To what state to switch
+depends on the implementation. Depending on the state, only certain commands
+are valid. An error may occur if an invalid command is triggered.
 
 \begin{enumerate}
 \item SET PARAMETERS
@@ -407,13 +419,13 @@ \subsubsection{PCM Control Messages}\label{sec:Device Types / Sound Device / Dev
 The driver negotiates the stream parameters (format, transport, etc) with
 the device.
 
-Possible valid transitions: set parameters, prepare.
+Possible valid commands: set parameters, prepare.
 
 \item PREPARE
 
 The device prepares the stream (allocates resources, etc).
 
-Possible valid transitions: set parameters, prepare, start, release.
+Possible valid commands: set parameters, prepare, start, release.
 
 \item Output only: the driver transfers data for pre-buffing.
 
@@ -421,7 +433,7 @@ \subsubsection{PCM Control Messages}\label{sec:Device Types / Sound Device / Dev
 
 The device starts the stream (unmute, putting into running state, etc).
 
-Possible valid transitions: stop.
+Possible valid commands: stop.
 
 \item The driver transfers data to/from the stream.
 
@@ -429,13 +441,13 @@ \subsubsection{PCM Control Messages}\label{sec:Device Types / Sound Device / Dev
 
 The device stops the stream (mute, putting into non-running state, etc).
 
-Possible valid transitions: start, release.
+Possible valid commands: start, release.
 
 \item RELEASE
 
 The device releases the stream (frees resources, etc).
 
-Possible valid transitions: set parameters, prepare.
+Possible valid commands: set parameters, prepare.
 
 \end{enumerate}
 
-- 
2.41.0

