Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92CCA33C9
	for <virtio-comment@lists.linux.dev>; Mon, 27 Jan 2025 09:21:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737969713; cv=none; b=DnTK22Tlls6KHUj01vYTniEUH6a7+qb+V9OjR4xhI+Wieylypp9bCVjJzfBtSimYH/dw9y1HvDdkAV+ybxElBoIYAnq/A6GR8EQJ2e6I9/b8OogWtYp0+EGn8Xr5Xdf9v9VoLdB0iMdr+qxEkbm2cSeLbOuZ7gUC7893Fh056lM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737969713; c=relaxed/simple;
	bh=0hIVm41qa8W7GsulyjBZ3Ozh8onBieZiUH1R/NbId0w=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=od8WCwnxo+kkPB7Wyzov2VNPABBzLM8GREXia8gLryIOgvcmrzDXvxS6JLG1JCXjz5zsrOLtcc+y1PoeDboSalEGI2epLRruf+ywy6vJzf3ad57JVTNyrfrdjeVclm+ilLVgNOG5vT65ufY3k4Z4gDLsNbT06rhCbkdEnZfBLPY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=M7SMnyKs; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="M7SMnyKs"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1737969710;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=FlC74Td7GmFST5xqrrTlBOLugNWX5OT0wIonPTUFagI=;
	b=M7SMnyKs2M6UF1Jlmi9CB2PtOqVnUVrE1uUaTbSZhxBfqlNXCwFoaAoI0eNy5F+RUzr2Ms
	Au1NvBMPazZC3NLJnRBUPPLT4AfMi84HxDKLAyPsY5LB7QsRSLHfLqidPBiiyxn6P3lIo/
	yxTalL8xMPNYHKxhbNIW+qHy+g2/2gQ=
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-391-OqAwROOlOk2V-xzfyeKXnQ-1; Mon,
 27 Jan 2025 04:21:48 -0500
X-MC-Unique: OqAwROOlOk2V-xzfyeKXnQ-1
X-Mimecast-MFC-AGG-ID: OqAwROOlOk2V-xzfyeKXnQ
Received: from mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.40])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id DB59518009A8;
	Mon, 27 Jan 2025 09:21:47 +0000 (UTC)
Received: from localhost (dhcp-192-212.str.redhat.com [10.33.192.212])
	by mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 2BEAA19560AD;
	Mon, 27 Jan 2025 09:21:46 +0000 (UTC)
From: Cornelia Huck <cohuck@redhat.com>
To: "Michael S. Tsirkin" <mst@redhat.com>, Parav Pandit <parav@nvidia.com>
Cc: "virtio-comment@lists.linux.dev" <virtio-comment@lists.linux.dev>,
 "mvaralar@redhat.com" <mvaralar@redhat.com>, Shahaf Shuler
 <shahafs@nvidia.com>
Subject: Re: [PATCH v1] virtio-net: Fix to avoid using reserved feature bits
In-Reply-To: <20250126114917-mutt-send-email-mst@kernel.org>
Organization: "Red Hat GmbH, Sitz: Werner-von-Siemens-Ring 12, D-85630
 Grasbrunn, Handelsregister: Amtsgericht =?utf-8?Q?M=C3=BCnchen=2C?= HRB
 153243,
 =?utf-8?Q?Gesch=C3=A4ftsf=C3=BChrer=3A?= Ryan Barnhart, Charles Cachera,
 Michael O'Neill, Amy
 Ross"
References: <20250126062058.13695-1-parav@nvidia.com>
 <20250126041732-mutt-send-email-mst@kernel.org>
 <CY8PR12MB71954013A3A3E5F81E03CD9CDCED2@CY8PR12MB7195.namprd12.prod.outlook.com>
 <20250126114917-mutt-send-email-mst@kernel.org>
User-Agent: Notmuch/0.38.3 (https://notmuchmail.org)
Date: Mon, 27 Jan 2025 10:21:44 +0100
Message-ID: <877c6g8vdj.fsf@redhat.com>
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.40
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: CHmVvTfX6GPsSc1KKZqKh_zkC7eAiKa2JlSwgoeQ7G0_1737969708
X-Mimecast-Originator: redhat.com
Content-Type: text/plain

On Sun, Jan 26 2025, "Michael S. Tsirkin" <mst@redhat.com> wrote:

> On Sun, Jan 26, 2025 at 04:44:51PM +0000, Parav Pandit wrote:
>> 
>> 
>> > From: Michael S. Tsirkin <mst@redhat.com>
>> > Sent: Sunday, January 26, 2025 2:50 PM
>> > 
>> > On Sun, Jan 26, 2025 at 08:20:58AM +0200, Parav Pandit wrote:
>> > > Listed patches in the fixes tag, incorrectly used the reserved feature bits.
>> > > Fix them to use the well defined device specific range.
>> > >
>> > > Fixes: https://github.com/oasis-tcs/virtio-spec/issues/212
>> > > Fixes: https://github.com/oasis-tcs/virtio-spec/issues/213
>> > > Fixes: 8cd457d8aa82 ("virtio-net: define UDP tunnel segmentation
>> > > offload feature")
>> > > Fixes: 3fea589bd7c6 ("virtio-net: define UDP tunnel checksum offload
>> > > feature")
>> > 
>> > 
>> > Well the hashes will be wrong I think.
>> I pulled the patches from the mailing list to local repo using b4.
>> Once the new fix is voted, I will merge both the series together so that hashes stays the same.
>
> ok. just make sure to verify them before you push.
>
>> > So, we can do the ballot for this fixup, and wait with applying the patches
>> > until that new ballot completes.
>> Yes. The small fix is reviewed by Paolo and Cornelia, so if it looks ok, we can wait for this week for any additional review comments.
>> And merge by Feb-10 or so after new ballot completes.
>
>
> Acked-by: Michael S. Tsirkin <mst@redhat.com>

As I don't see this change as particularly contentious, I'd suggest to
just go ahead and start the voting process -- there's plenty of time to
voice concerns while the ballot is open.

