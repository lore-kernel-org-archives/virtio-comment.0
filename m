Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BABD186294
	for <virtio-comment@lists.linux.dev>; Tue, 15 Apr 2025 14:39:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744727946; cv=none; b=uqFfWLXHoEwB3IcuIhCMhiAhZq5mQmiLI0G57sOVKhYMqPLnE3hZR43z9iBCl4jw31RJoeI8M3ttjQCADc9H04BwMuu/653zyIPWkzeFNm7uUUXf76GTAlvmYLCNUKdt5nsbgtCbGz5A6sxYz9nQ867MYvqTRYFpjjigPpcC20g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744727946; c=relaxed/simple;
	bh=WH4Sq4miC6wJXtV+yVq2aC4XboUQjC/S68S6NiY3ziU=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=DvzzSrbQwifv5KlEh69+aGbO8dOOdT6mgIoC3dukYy8ynP9v9kH1F7vIgbvEa1IiPPp3ItHZfe3tMCDivc/Jgc+rptOaAHI30bSUcvitdgTccVXxvuyDBzfVI/h4iybdubunX/PejjkLNvrOZhBhYfJ17Raudxc2HKkiD3ekuE4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=U2RCVILT; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="U2RCVILT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1744727942;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=u0LvZgQW6gPDs76QumK5K6iGoCh2AOy5kQWtTOoR/tI=;
	b=U2RCVILTxuae+rN2GWyrUKIe/VP00ywaCvr9uQMb/FjJSRCWKbf+MqAKNoQZG0cSVHM4pp
	2jXWlULzKo6NkgkFPpanS4Ct4FJCRLGUZCR2O5zuBdmbRUFYsSbqixJEbtV7W9vffhh6hp
	IGu6hjPdOcLflqFK7P4SGQ4f28bOPic=
Received: from mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-592-8899iE7MNpukPr1KwYz9nA-1; Tue,
 15 Apr 2025 10:38:59 -0400
X-MC-Unique: 8899iE7MNpukPr1KwYz9nA-1
X-Mimecast-MFC-AGG-ID: 8899iE7MNpukPr1KwYz9nA_1744727938
Received: from mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.111])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 6FF1219560B0;
	Tue, 15 Apr 2025 14:38:58 +0000 (UTC)
Received: from localhost (dhcp-192-216.str.redhat.com [10.33.192.216])
	by mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id B2F731801747;
	Tue, 15 Apr 2025 14:38:57 +0000 (UTC)
From: Cornelia Huck <cohuck@redhat.com>
To: Peter Hilber <quic_philber@quicinc.com>
Cc: virtio-comment@lists.linux.dev, Parav Pandit <parav@nvidia.com>, Jason
 Wang <jasowang@redhat.com>, David Woodhouse <dwmw2@infradead.org>, "Ridoux,
 Julien" <ridouxj@amazon.com>, Trilok Soni <quic_tsoni@quicinc.com>, Matias
 Ezequiel Vara Larsen <mvaralar@redhat.com>
Subject: Re: [PATCH v8 1/4] virtio-rtc: Add initial device specification
In-Reply-To: <5yakav2wrh2kaib7o5rmevzi7r4kgkgb6fnwpazjiath7mfu4q@p6pox5hylwhx>
Organization: "Red Hat GmbH, Sitz: Werner-von-Siemens-Ring 12, D-85630
 Grasbrunn, Handelsregister: Amtsgericht =?utf-8?Q?M=C3=BCnchen=2C?= HRB
 153243,
 =?utf-8?Q?Gesch=C3=A4ftsf=C3=BChrer=3A?= Ryan Barnhart, Charles Cachera,
 Michael O'Neill, Amy
 Ross"
References: <20250306095112.1293-1-quic_philber@quicinc.com>
 <20250306095112.1293-2-quic_philber@quicinc.com>
 <87plhdsfp9.fsf@redhat.com>
 <5yakav2wrh2kaib7o5rmevzi7r4kgkgb6fnwpazjiath7mfu4q@p6pox5hylwhx>
User-Agent: Notmuch/0.38.3 (https://notmuchmail.org)
Date: Tue, 15 Apr 2025 16:38:55 +0200
Message-ID: <87jz7lsd4w.fsf@redhat.com>
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.111
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: JZ5vDCPV8dvcuMQ1i0o7nddMlVlzQw9EQfmzPQWqImk_1744727938
X-Mimecast-Originator: redhat.com
Content-Type: text/plain

On Tue, Apr 15 2025, Peter Hilber <quic_philber@quicinc.com> wrote:

> On Tue, Apr 15, 2025 at 03:43:30PM +0200, Cornelia Huck wrote:
>> On Thu, Mar 06 2025, Peter Hilber <quic_philber@quicinc.com> wrote:
>> 
>> > The virtio-rtc device provides information about current time through
>> > one or more clocks. As such, it is a Real-Time Clock (RTC) device.
>> >
>> > The normative statements for this device follow in the next patch.
>> >
>> > For this device, there is an RFC Linux kernel driver which is being
>> > upstreamed, and a proprietary device implementation.
>> >
>> > Miscellaneous
>> > -------------
>> >
>> > The spec does not specify how a driver should interpret clock readings,
>> > esp. also not how to perform clock synchronization.
>> >
>> > The device uses the "Timer/Clock" device id which is already part of the
>> > specification. This device id was registered a long time ago and should
>> > be unused according to the author's information. The name "RTC" was
>> > determined to be the best for a device which focuses on current time.
>> >
>> > Signed-off-by: Peter Hilber <quic_philber@quicinc.com>
>> 
>> (...)
>> 
>> [First of all, apologies for the very late feedback...]
>> 
>> > +The \field{status} field indicates whether the device successfully
>> > +executed the request. The device sets the \field{status} field to one of
>> > +the following values:
>> > +
>> > +\begin{lstlisting}
>> > +#define VIRTIO_RTC_S_OK         0
>> > +#define VIRTIO_RTC_S_EOPNOTSUPP 2
>> > +#define VIRTIO_RTC_S_ENODEV     3
>> > +#define VIRTIO_RTC_S_EINVAL     4
>> > +#define VIRTIO_RTC_S_EIO        5
>> > +\end{lstlisting}
>> 
>> Any reason there's no status code 1 here? (I assume there used to be
>> one... not a real problem, I just stumbled over it.)
>> 
>
> Status code 1 would be the same as VIRTIO_NET_ERR.
>
> In the past, there was some discussion about reusing the spec in the net
> device, so I changed the status values to align with the net control
> virtqueue ack values. I am not sure if this will be helpful, should the
> net device reuse ever materialize, since AFAIU the admin queue might
> be used instead of the net control virtqueue.

Thanks for the explanation -- I think it's fine to just leave it as it
is now, the important thing is that the values are specified.

