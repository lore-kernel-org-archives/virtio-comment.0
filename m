Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1AB8C1AAE38
	for <virtio-comment@lists.linux.dev>; Wed, 31 Jul 2024 10:15:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722420941; cv=none; b=D/ktw18MQQnPV2DS4ffj7U45fuJZm33HIr33AULNQi9aBSxHLqjKt+/cPYQNg9NU9gJkCJmKj/kvmQoaasHFTGJ6wJp0wbBTDrs6vBakty9xgwGvIl+csrYp6bgHO9KWWR5vdo9/sPR6A38yb98/houvIYdfirdX5C3WfcJ2Iyw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722420941; c=relaxed/simple;
	bh=04NjuA00H+cDeyPoT9ipYVmf2TIEKGI8Y+xRfxTMkYA=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=ujzjgrr+QSdNOl+4C95OpQWnxBKdQ7efYiiz7lTwgST4zrOd2zwkYVFS5Lx8QHmTrvlCw2Wc9NvPtLEXbRQ3kaeAlBK6QbQfn0QXo+LB54yoelTsRYtt5l4k1gFcLkY+La1YA3TftGT7QkhQCgMxTkXOlO11NxN43jwT/z0ewUA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=dflLKLQi; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="dflLKLQi"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1722420939;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=W47lJY9ilAAAWDJkYXDJUaPy6RKr70KAl+OjPY/KnZs=;
	b=dflLKLQic/JJO//uMkgo0nfZ2g1TQWaDoBkm5RJtGiGJhEMvQJkmF9uP/lmveT71hUCLm/
	FXtPISqHNWu4GwXobfxIq1boIkALOpZw7iLkkuAoNXXRlBrougSH0VJsxWESpU+7bvxImk
	PDsHqvKfRvMjcKfVGxIpBd4zh/WUKa4=
Received: from mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-338-il_LAYrHP1G0l4Tq5_z85Q-1; Wed,
 31 Jul 2024 06:15:35 -0400
X-MC-Unique: il_LAYrHP1G0l4Tq5_z85Q-1
Received: from mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.15])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 8536F19560A3;
	Wed, 31 Jul 2024 10:15:34 +0000 (UTC)
Received: from localhost (dhcp-192-176.str.redhat.com [10.33.192.176])
	by mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id AB6C41955D42;
	Wed, 31 Jul 2024 10:15:33 +0000 (UTC)
From: Cornelia Huck <cohuck@redhat.com>
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: Viresh Kumar <viresh.kumar@linaro.org>, virtio-comment@lists.linux.dev,
 Vincent Guittot <vincent.guittot@linaro.org>, Alex =?utf-8?Q?Benn=C3=A9e?=
 <alex.bennee@linaro.org>, Manos Pitsidianakis
 <manos.pitsidianakis@linaro.org>, Parav Pandit <parav@nvidia.com>, Matias
 Ezequiel Vara Larsen <mvaralar@redhat.com>, Stefano Garzarella
 <sgarzare@redhat.com>
Subject: Re: [PATCH V8] virtio-transport: Add a section to define mandatory
 transport requirements
In-Reply-To: <20240731055129-mutt-send-email-mst@kernel.org>
Organization: "Red Hat GmbH, Sitz: Werner-von-Siemens-Ring 12, D-85630
 Grasbrunn, Handelsregister: Amtsgericht =?utf-8?Q?M=C3=BCnchen=2C?= HRB
 153243,
 =?utf-8?Q?Gesch=C3=A4ftsf=C3=BChrer=3A?= Ryan Barnhart, Charles Cachera,
 Michael O'Neill, Amy
 Ross"
References: <1ef4e58fdbbc2c94305aa8fac856da882da1cdc2.1722324234.git.viresh.kumar@linaro.org>
 <20240730091155-mutt-send-email-mst@kernel.org>
 <20240731090414.m5hkzvq34djq6awl@vireshk-i7> <87a5hx99se.fsf@redhat.com>
 <20240731055129-mutt-send-email-mst@kernel.org>
User-Agent: Notmuch/0.38.3 (https://notmuchmail.org)
Date: Wed, 31 Jul 2024 12:15:30 +0200
Message-ID: <877cd198al.fsf@redhat.com>
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.15
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain

On Wed, Jul 31 2024, "Michael S. Tsirkin" <mst@redhat.com> wrote:

> On Wed, Jul 31, 2024 at 11:43:13AM +0200, Cornelia Huck wrote:
>> On Wed, Jul 31 2024, Viresh Kumar <viresh.kumar@linaro.org> wrote:
>> 
>> > On 30-07-24, 09:14, Michael S. Tsirkin wrote:
>> >> Let's order it sensibly though, in the order in which stuff is used
>> >
>> > Right.
>> >
>> > diff --git a/newtransport.tex b/newtransport.tex
>> > new file mode 100644
>> > index 000000000000..3b760250a4c0
>> > --- /dev/null
>> > +++ b/newtransport.tex
>> > @@ -0,0 +1,44 @@
>> > +\chapter{Creating New Transports}\label{sec:Creating New Transports}
>> > +
>> > +Devices and drivers utilize various transport methods to facilitate
>> > +communication, such as PCI, MMIO, or Channel I/O. These transport
>> > +methods determine multiple aspects of the interaction between the device
>> > +and the driver, including device discovery, capability exchange,
>> > +interrupt handling, and data transfer. For instance, in a host/guest
>> > +architecture, the host might expose a device to the guest via a virtual
>> > +PCI bus, and the guest would employ a PCI device driver to interface
>> > +with the device.
>> > +
>> > +This section outlines the mandatory requirements that a transport method
>> > +implements.
>> > +
>> > +A transport provides a mechanism to implement configuration space for
>> > +the device.
>> > +
>> > +A transport provides a mechanism for the driver to identify the device
>> > +type.
>> > +
>> > +A transport provides a mechanism for the driver to read the device's
>> > +status bit.
>> 
>> Either "status bits", or "status" (as below.)
>
> It is actually "FEATURES_OK status bit" I think.

Also DEVICE_NEEDS_RESET? I don't think it makes sense to say that the
driver needs a way to read individual bits, it should be able to read
the whole status.

