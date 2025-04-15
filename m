Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74C6715666D
	for <virtio-comment@lists.linux.dev>; Tue, 15 Apr 2025 13:43:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744724621; cv=none; b=iAG4OJl3OBnoYdkewv/CYjgG6T94dxes0bIfmwoYx/yQfd87SpuboVHWd23iOpn/b3PlC2fUGxOWh6/jDAjAQb8j+tys9tiZlSiD/CDaSmzDKVSpozQfeNYUKoySDOFTM0c2xuUvaPH7SJTcmU0I5/KesQeKmX7+ZGjle0OsTCc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744724621; c=relaxed/simple;
	bh=yya1HjuB6HH2d2m46ab3DC6vV+s65xEr1rj8TbAFLIY=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=b0TrOLPTgubeiCn1FgKuQbmX11Q0PutKgLv3fIOB3eRugzZHpz+gfd1fSz7BZrGVx5fctTH7YaRzWEF4pU6X/5qIXSvDr12F44gytSNvhRYGobdYZ4EqLiUyvIpxwGlKfcUpbpyeyEvMP69UHJ7IEwJVTmhTzM+Smc09l0qn+ZY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=dcwaIiVW; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="dcwaIiVW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1744724618;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=DVNk6HW9FcfIZL3B7oankAQbdu/dUPFBc1eVHxf8dXc=;
	b=dcwaIiVWBm+HvAyew3RZky8fSBJQeKvOOB0J7wcoru2f0/8P9/dPcLrycu4s7qozu3g1yr
	pkfMjPPgVi/Dd8iR8aDIF2rMtnuqUmkNhtY3XT/NQl67QGFcM9khj2UPQiMHJqyXJkbacG
	pFzPIWabsycfREnPCfhR5v0FVl/8sdA=
Received: from mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-61-SvzdqsLYNaG1_k3UnzZX9Q-1; Tue,
 15 Apr 2025 09:43:35 -0400
X-MC-Unique: SvzdqsLYNaG1_k3UnzZX9Q-1
X-Mimecast-MFC-AGG-ID: SvzdqsLYNaG1_k3UnzZX9Q_1744724614
Received: from mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.12])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id C282019560B7;
	Tue, 15 Apr 2025 13:43:33 +0000 (UTC)
Received: from localhost (dhcp-192-216.str.redhat.com [10.33.192.216])
	by mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id D14C119560AD;
	Tue, 15 Apr 2025 13:43:32 +0000 (UTC)
From: Cornelia Huck <cohuck@redhat.com>
To: Peter Hilber <quic_philber@quicinc.com>, virtio-comment@lists.linux.dev
Cc: Parav Pandit <parav@nvidia.com>, Jason Wang <jasowang@redhat.com>, David
 Woodhouse <dwmw2@infradead.org>, "Ridoux, Julien" <ridouxj@amazon.com>,
 Trilok Soni <quic_tsoni@quicinc.com>, Matias Ezequiel Vara Larsen
 <mvaralar@redhat.com>, Peter Hilber <quic_philber@quicinc.com>
Subject: Re: [PATCH v8 1/4] virtio-rtc: Add initial device specification
In-Reply-To: <20250306095112.1293-2-quic_philber@quicinc.com>
Organization: "Red Hat GmbH, Sitz: Werner-von-Siemens-Ring 12, D-85630
 Grasbrunn, Handelsregister: Amtsgericht =?utf-8?Q?M=C3=BCnchen=2C?= HRB
 153243,
 =?utf-8?Q?Gesch=C3=A4ftsf=C3=BChrer=3A?= Ryan Barnhart, Charles Cachera,
 Michael O'Neill, Amy
 Ross"
References: <20250306095112.1293-1-quic_philber@quicinc.com>
 <20250306095112.1293-2-quic_philber@quicinc.com>
User-Agent: Notmuch/0.38.3 (https://notmuchmail.org)
Date: Tue, 15 Apr 2025 15:43:30 +0200
Message-ID: <87plhdsfp9.fsf@redhat.com>
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.12
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: bL4Jw12g95aARCnph1J4IkCz9Si0QbohL1r1dYXg7Mg_1744724614
X-Mimecast-Originator: redhat.com
Content-Type: text/plain

On Thu, Mar 06 2025, Peter Hilber <quic_philber@quicinc.com> wrote:

> The virtio-rtc device provides information about current time through
> one or more clocks. As such, it is a Real-Time Clock (RTC) device.
>
> The normative statements for this device follow in the next patch.
>
> For this device, there is an RFC Linux kernel driver which is being
> upstreamed, and a proprietary device implementation.
>
> Miscellaneous
> -------------
>
> The spec does not specify how a driver should interpret clock readings,
> esp. also not how to perform clock synchronization.
>
> The device uses the "Timer/Clock" device id which is already part of the
> specification. This device id was registered a long time ago and should
> be unused according to the author's information. The name "RTC" was
> determined to be the best for a device which focuses on current time.
>
> Signed-off-by: Peter Hilber <quic_philber@quicinc.com>

(...)

[First of all, apologies for the very late feedback...]

> +The \field{status} field indicates whether the device successfully
> +executed the request. The device sets the \field{status} field to one of
> +the following values:
> +
> +\begin{lstlisting}
> +#define VIRTIO_RTC_S_OK         0
> +#define VIRTIO_RTC_S_EOPNOTSUPP 2
> +#define VIRTIO_RTC_S_ENODEV     3
> +#define VIRTIO_RTC_S_EINVAL     4
> +#define VIRTIO_RTC_S_EIO        5
> +\end{lstlisting}

Any reason there's no status code 1 here? (I assume there used to be
one... not a real problem, I just stumbled over it.)

