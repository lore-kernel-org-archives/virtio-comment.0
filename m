Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6D7046AF
	for <virtio-comment@lists.linux.dev>; Thu, 23 May 2024 11:00:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716462044; cv=none; b=THLe/CpJR8t6S8HVAtL/qeqytHUAK0V0OC/ufmqXCfyLCFArPwsEKRpQgxN/r3bGGWd0kEqxuxcP4BA57mGJP9wGc3OUtRth1NSS+09KBmm/ngGE9h0Cu9IpnN4qVD5/Ppvue3xGfDFNNZ6BU5324+UjlX+dq3jan4I7aPuH+OM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716462044; c=relaxed/simple;
	bh=1HxzRRQ0TejJxgV+ZNgloAx7l5lvv56h8DpiF2SNT8w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=GDjqmGEfr5cZUQbBgwhBpGwu0ILvTZXBRuTdo2RS7CPXhYGThAlFeOgwh8Fpi/hxREggmxuyRTyvzpUfXNVhauFp1v4TcISfql6xNSx0gy0rYqoxrOLcND+F/eQ3npZSq/JaRQlw9T9444x9dCwV5ZVoBLRcxmbamSP8L2timbY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=OhIn71EQ; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="OhIn71EQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1716462041;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=2b2yjqq3AApjOL4POd9lqcibqpjpwiSV0cd8e2zDtKI=;
	b=OhIn71EQawjjkkaY2hnSjV4lrR+J5Y2dqBxQOiqkVf8oDarW0mA1l+5i/qA1iP9UJphrvz
	JkEoklToy7pnxA6wgw3GvRX3tDwQj7r8IVEVOBryWvMaoyACOvvR/GgUZiTVoUvbUqHAo9
	OjG/uY//k8GKnyDuClesvgN3MM0aNc0=
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-542-xkbO7l2_NVmJTQnkKYjdqQ-1; Thu, 23 May 2024 07:00:40 -0400
X-MC-Unique: xkbO7l2_NVmJTQnkKYjdqQ-1
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-6ab6d255faeso47959626d6.1
        for <virtio-comment@lists.linux.dev>; Thu, 23 May 2024 04:00:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716462039; x=1717066839;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2b2yjqq3AApjOL4POd9lqcibqpjpwiSV0cd8e2zDtKI=;
        b=kEk5SeyvWpDtdutyorkW08cHTOWCn2i7qNIJ+EN/Zi/fB1a/yTkGYhooECrGQWhxdd
         hacQxbfkUmb4Xo1c9d021NFEcjvMq/yj1xU8InfjbgSgSXewLvz22icJmViSpDkGjQby
         +69sUpOcpIEctNoZjJHnrmkipoNOC3TvHhq53J/chjXKHzVyOr7VOj+NRCzC/Td1fQAb
         9JBZzh8WnOUuI5vjMyzSI3XQzd9keWqC3+FD8fUCl2Fx8ZdcNS2KW8YH9AtoE17bRHWf
         1C7aHbZw68lZAwUhTDwFBVLT/c1/N7QXo86IosSK3wJD02Dgih6ruT8EAXnIDj2bT2Vc
         GCzA==
X-Gm-Message-State: AOJu0YwTVdDh3jf/gK6xJUBRba1F4hF2zZbXRhTgliEzm5L4LapOshhR
	/7aa8WSW4J35HMEzr4yHxrETe3TF+fqHcrpEcaXAOTkMDlxKOLJXTHEizkPy9ItDhexZasXIh/a
	V71NkXO+dwvqkvH0nmNE0prNf42XZr/bJRbSiU3wLT27vGa2Z2BVrb3dBmjNsnA3A
X-Received: by 2002:a0c:f20a:0:b0:6a9:82d0:b806 with SMTP id 6a1803df08f44-6ab80900ce9mr34834576d6.45.1716462039430;
        Thu, 23 May 2024 04:00:39 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFi623CID2fTs7VgdLLZnlCNYQ7zT2VfKTaY+iEUFDi4rbPws3ZRbM6fAxqUz8g8jCe+BntUg==
X-Received: by 2002:a0c:f20a:0:b0:6a9:82d0:b806 with SMTP id 6a1803df08f44-6ab80900ce9mr34834376d6.45.1716462038866;
        Thu, 23 May 2024 04:00:38 -0700 (PDT)
Received: from sgarzare-redhat (host-79-53-30-109.retail.telecomitalia.it. [79.53.30.109])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6ab98de69acsm515026d6.34.2024.05.23.04.00.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 May 2024 04:00:37 -0700 (PDT)
Date: Thu, 23 May 2024 13:00:32 +0200
From: Stefano Garzarella <sgarzare@redhat.com>
To: Matias Ezequiel Vara Larsen <mvaralar@redhat.com>
Cc: virtio-comment@lists.linux.dev, anton.yakovlev@opensynergy.com
Subject: Re: [PATCH Resend] virtio-snd: improve PCM command lifecycle
 description
Message-ID: <l2f7vf2nzrejy5rk7moymxgsrts3jh5pqcubctbzzmzzsoz4u4@4x63sz5u4ovg>
References: <Zky6Disx1ofmETmn@fedora>
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <Zky6Disx1ofmETmn@fedora>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline

On Tue, May 21, 2024 at 05:13:18PM GMT, Matias Ezequiel Vara Larsen wrote:
>The PCM command lifecycle can be described as a state-machine in which
>the switching between states is triggered by commands. This commit
>explicitly presents the different states and the commands that are
>allowed in a given state. This commit leaves to the implementation the
>decision the state reached depending on the command.
>
>Signed-off-by: Matias Ezequiel Vara Larsen <mvaralar@redhat.com>
>---
> device-types/sound/description.tex | 26 +++++++++++++++++++-------
> 1 file changed, 19 insertions(+), 7 deletions(-)
>
>diff --git a/device-types/sound/description.tex b/device-types/sound/description.tex
>index 54c9c8e..55e93af 100644
>--- a/device-types/sound/description.tex
>+++ b/device-types/sound/description.tex
>@@ -397,9 +397,21 @@ \subsubsection{PCM Control Messages}\label{sec:Device Types / Sound Device / Dev
> \item[\field{stream_id}] specifies a PCM stream identifier from 0 to \field{streams} - 1.
> \end{description}
>
>-\paragraph{PCM Command Lifecycle}
>+\paragraph{PCM Command Lifecycle State Machine}
>
>-A PCM stream has the following command lifecycle:
>+A PCM stream can be represented by a state-machine made up of the following
>+states:

I'm not clear about the difference between commands and states. Are they 
the same?

>+\begin{description}
>+\item SET PARAMETERS
>+\item PREPARE
>+\item START
>+\item STOP
>+\item RELEASE
>+\end{description}
>+
>+A command triggers the transition between these states. To what state to switch
>+depends on the implementation. Depending on the state, only certain commands
>+are valid. An error may occur if an invalid command is triggered.
>

Should we explain what the following list is?

> \begin{enumerate}
> \item SET PARAMETERS
>@@ -407,13 +419,13 @@ \subsubsection{PCM Control Messages}\label{sec:Device Types / Sound Device / Dev
> The driver negotiates the stream parameters (format, transport, etc) with
> the device.
>
>-Possible valid transitions: set parameters, prepare.
>+Possible valid commands: set parameters, prepare.
>
> \item PREPARE
>
> The device prepares the stream (allocates resources, etc).
>
>-Possible valid transitions: set parameters, prepare, start, release.
>+Possible valid commands: set parameters, prepare, start, release.
>
> \item Output only: the driver transfers data for pre-buffing.
>
>@@ -421,7 +433,7 @@ \subsubsection{PCM Control Messages}\label{sec:Device Types / Sound Device / Dev
>
> The device starts the stream (unmute, putting into running state, etc).
>
>-Possible valid transitions: stop.
>+Possible valid commands: stop.
>
> \item The driver transfers data to/from the stream.
>
>@@ -429,13 +441,13 @@ \subsubsection{PCM Control Messages}\label{sec:Device Types / Sound Device / Dev
>
> The device stops the stream (mute, putting into non-running state, etc).
>
>-Possible valid transitions: start, release.
>+Possible valid commands: start, release.
>
> \item RELEASE
>
> The device releases the stream (frees resources, etc).
>
>-Possible valid transitions: set parameters, prepare.
>+Possible valid commands: set parameters, prepare.
>
> \end{enumerate}
>
>-- 
>2.41.0
>
>

