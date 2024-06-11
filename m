Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24EBC2E622
	for <virtio-comment@lists.linux.dev>; Tue, 11 Jun 2024 15:29:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718119744; cv=none; b=RHmpG6+xxwZHL+MWbTcrbtaMiFzDSMKE9yUtFod/V5tFEd8KRygqaPbhPZJXwsde1HcB3WEOSiXe4hy0pjsKjCCLTqdgLmM794wTRqjGHE1/5jIVeLd4BlKb22v/29Ab4jSUtv93L5ITGN/PPArGEPek0QzJBKpvIeD2zAnbaBc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718119744; c=relaxed/simple;
	bh=+C/zvHp06vyJnDnoeFXm0/toleNAcA2KwtyJwV8KeS0=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=KudzE/CE+mNf+SfRVye9gl7BGsRQIFhrpGtjU0z/qEsdHYN+HLdoeSeEZwuFTz80j923AIQKt7R6B5103KYwWZ1udPSNnwI4Cz6dAEKo3mVhgQMs7kUHqwJ+jV1DGAc1U5WaApo/CYq+CmPD6ovVstFvLOczF5QyXi4sQS3pCzs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=O92KnH7v; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="O92KnH7v"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1718119741;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=JwuBFYlfqKUpg9tlh3AfTGyDudR6nXAi9qInnnEjX5I=;
	b=O92KnH7vpSALkCsnoGTB95inG6NOIcb2AWg1CCUEBxyf2xQdmOIgHSLRzTh53dJIHKwG82
	MdxoyYB693X0H6SRsBYm1ZMNNo2X6Ybkc/mZ+ydCVQdgcdu/z7L5nBCm99uYCEG6TDN4GC
	nNz2t3XCQqQB9ZWrDAfmczsFwiu3sB8=
Received: from mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-576-mFfzx3ZmMn2q_LF9Gpa-VQ-1; Tue,
 11 Jun 2024 11:28:57 -0400
X-MC-Unique: mFfzx3ZmMn2q_LF9Gpa-VQ-1
Received: from mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id C0A6C1955BD9;
	Tue, 11 Jun 2024 15:28:54 +0000 (UTC)
Received: from localhost (unknown [10.39.193.118])
	by mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 807CA1956055;
	Tue, 11 Jun 2024 15:28:53 +0000 (UTC)
From: Cornelia Huck <cohuck@redhat.com>
To: Parav Pandit <parav@nvidia.com>, Viresh Kumar <viresh.kumar@linaro.org>,
 "virtio-comment@lists.linux.dev" <virtio-comment@lists.linux.dev>
Cc: Vincent Guittot <vincent.guittot@linaro.org>, Alex =?utf-8?Q?Benn?=
 =?utf-8?Q?=C3=A9e?=
 <alex.bennee@linaro.org>, "stratos-dev@op-lists.linaro.org"
 <stratos-dev@op-lists.linaro.org>, Manos Pitsidianakis
 <manos.pitsidianakis@linaro.org>, "Michael
 S. Tsirkin" <mst@redhat.com>
Subject: RE: [PATCH V5] virtio-transport: Clarify requirements
In-Reply-To: <PH0PR12MB5481413D59F2DC236F0B59DFDCC72@PH0PR12MB5481.namprd12.prod.outlook.com>
Organization: "Red Hat GmbH, Sitz: Werner-von-Siemens-Ring 12, D-85630
 Grasbrunn, Handelsregister: Amtsgericht =?utf-8?Q?M=C3=BCnchen=2C?= HRB
 153243,
 =?utf-8?Q?Gesch=C3=A4ftsf=C3=BChrer=3A?= Ryan Barnhart, Charles Cachera,
 Michael O'Neill, Amy
 Ross"
References: <9d543789de03d26a27a43ae8f7621d07d66e8731.1718084050.git.viresh.kumar@linaro.org>
 <PH0PR12MB5481413D59F2DC236F0B59DFDCC72@PH0PR12MB5481.namprd12.prod.outlook.com>
User-Agent: Notmuch/0.38.3 (https://notmuchmail.org)
Date: Tue, 11 Jun 2024 17:28:51 +0200
Message-ID: <87plsnjy6k.fsf@redhat.com>
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.17
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain

On Tue, Jun 11 2024, Parav Pandit <parav@nvidia.com> wrote:

> Hi Viresh,
>
>> From: Viresh Kumar <viresh.kumar@linaro.org>
>> Sent: Tuesday, June 11, 2024 11:06 AM
>
> [..]
>> diff --git a/content.tex b/content.tex
>> index 0a62dce5f65f..e2a836327818 100644
>> --- a/content.tex
>> +++ b/content.tex
>> @@ -631,8 +631,86 @@ \section{Device Cleanup}\label{sec:General
>> Initialization And Device Operation /
>> 
>>  \chapter{Virtio Transport Options}\label{sec:Virtio Transport Options}
>> 
>> -Virtio can use various different buses, thus the standard is split -into virtio
>> general and bus-specific sections.
>> +Devices and drivers can use different transport methods to enable
>> +interaction, for example PCI, MMIO, or Channel I/O. The transport
>> +methods define various aspects of the communication between the device
>> +and the driver, like device discovery, exchanging capabilities,
>> +interrupt handling, data transfer, etc. For example, in a host/guest
>> +architecture, the host might expose a device to the guest on a PCI bus,
>> +and the guest will use a PCI-specific driver to interact with it.
>> +
>> +The standard contains sections describing the transport-agnostic parts
>> +of virtio, and sections describing how individual transports implement
>> +virtio.
>> +
>> +\section{Virtio Transport Requirements}\label{sec:Virtio Transport
>> +Options / Virtio Transport Requirements}
>> +
>> +There are some mechanisms that any transport is required to implement,
>> +and some requirements that devices and drivers are required to follow.
>> +
>> +\subsection{Transport Requirements}\label{sec:Virtio Transport Options
>> +/ Virtio Transport Requirements / Transport Requirements}
>> +
>> +A transport provides a mechanism for the driver to discover the device.
>> +
> I would like to add a normative.
>
> A transport MAY provide a mechanism to create and destroy virtio devices.
>
> (for example PCI transport provides this).
>

I'm not a fan of that statement: the transport already allows for the
driver to discover a device, whether that happens statically or
dynamically really is the choice of the transport, and I don't think we
should go into that much detail.

[I'll go offline now, so please don't expect further responses from me
right now...]

