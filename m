Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792643742;
	b=1kOQPik1CYWBEMxP7KdRnMz9ehTw0oyRNOUbdsWk92+Ots+PHTBFxPi8TPbG7Tphse2z
	 erLIaDdSOUceLs5AZtyU/AeK8Z3LGxgLXcRjOVIfFVaGIepDlrwmptGtdkTPYnFrHQmi5
	 qZfDwR4CBbGxjWPbjUr24IUaAUaeUEpXB3DQmVdlajSvABkS8bRrUtKD4h4bTxpnp2Z4s
	 qStCmrp1tHOZJZi+R6vP5ZBFUR8nCL+E+A2L7l6BHe70G9TpKyk0t+VcMR9+7m5Cb6NZc
	 qdE7yH+2FEoP/mD0Cp7NkXfveNE7rJLgkmUAnFFwr8TqNDraInlgrRioBae0y+Qx+6g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792643742;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:Received:From:To:Cc:Subject:
	 In-Reply-To:Organization:References:User-Agent:Date:Message-ID:
	 MIME-Version:X-Scanned-By:X-Mimecast-Spam-Score:
	 X-Mimecast-MFC-PROC-ID:X-Mimecast-Originator:Content-Type;
	bh=6POYCoX6Ch2YcWRjPdQZlPNw3dniGp6JabcGza2g2p0=;
	b=MtuP2qtVtN9Bi1paBQ9sPaAVXdbwmb1CD2ghohTXggHqYdVvg2vWzIgH5H01VKMytYvx
	 DhTNi9iFElcs/ER/1LN+nGlQVN1bbgT0u3YytKwy54Ij7em6kyg0qkGwOC8/00vt3drZw
	 eKWR6Vxj7jAEeUUM5PTOR/YZV0iGhjrwe2RE4ih5gO3HtX+VBLwuK2sMER4nMO8GqZaPn
	 Pin8A7GU5F5vo7/YRNQqhHTvqWvVvFYa9d9S3dbyGpg33jfvolGT1ACxLVVkozgz7FfxN
	 4lHLn6+zmtLDNMF3GMX+QsKlJuS/J4S0+KOoAwE/SdIlboZpKwJctaQ3RQiXewV+DlQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=O1xUUM1+;
	arc=none smtp.remote-ip=170.10.133.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7933E606A319
	for <virtio-comment@lists.linux.dev>; Thu, 22 Oct 2026 04:35:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7933E606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=O1xUUM1+
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1792643740;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=6POYCoX6Ch2YcWRjPdQZlPNw3dniGp6JabcGza2g2p0=;
	b=O1xUUM1+v65KFD2DiprauqnOCz4jjsGaTFC/EXjn+4XbbXoJ7ESg7WhhUF2xwpbLOo+1F/
	9m6qk+6tKFI7Ic9nEV+gTDfFn53hZgskW8eMaAhDn/NxHZr2LRnKGUi/nIReClqjM6WYyY
	47jJCwTb19V1CWWQssuzpoDYZS1u+XI=
Received: from mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-394-plHxF-66OYW7WuY0_TJ_dQ-1; Thu,
 22 Oct 2026 04:35:36 +0000
X-MC-Unique: plHxF-66OYW7WuY0_TJ_dQ-1
X-Mimecast-MFC-AGG-ID: plHxF-66OYW7WuY0_TJ_dQ_1792643734
Received: from mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id A40201955D69;
	Thu, 22 Oct 2026 04:35:34 +0000 (UTC)
Received: from localhost (headnet04.pony-001.prod.iad2.dc.redhat.com [10.2.32.116])
	by mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 4ED1230000E3;
	Thu, 22 Oct 2026 04:35:32 +0000 (UTC)
From: Cornelia Huck <cohuck@redhat.com>
To: "Michael S. Tsirkin" <mst@redhat.com>, Demi Marie Obenour
 <demiobenour@gmail.com>
Cc: Peter Hilber <peter.hilber@oss.qualcomm.com>,
 virtio-comment@lists.linux.dev, Jan Kiszka <jan.kiszka@siemens.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Trilok Soni
 <trilok.soni@oss.qualcomm.com>
Subject: Re: [PATCH v2] content: Reserve ID 52 for QPSFI device
In-Reply-To: <20261021154801-mutt-send-email-mst@kernel.org>
Organization: "Red Hat GmbH, Sitz: Werner-von-Siemens-Ring 12, D-85630
 Grasbrunn, Handelsregister: Amtsgericht =?utf-8?Q?M=C3=BCnchen=2C?= HRB
 153243,
 =?utf-8?Q?Gesch=C3=A4ftsf=C3=BChrer=3A?= Ryan Barnhart, Charles Cachera,
 Avril Crosse O'Flaherty"
References: <20261021180031.7175-1-peter.hilber@oss.qualcomm.com>
 <d4a11a65-ebed-41c9-8482-cf0ec94dce79@gmail.com>
 <20261021154801-mutt-send-email-mst@kernel.org>
User-Agent: Notmuch/0.40 (https://notmuchmail.org)
Date: Thu, 22 Oct 2026 06:35:28 +0200
Message-ID: <87mrs62vzj.fsf@redhat.com>
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Post: <mailto:virtio-comment@lists.linux.dev>
List-Help: <mailto:virtio-comment+help@lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
List-Owner: <mailto:virtio-comment+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.4
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: y3-Zjd4qMq-EIiCL1hWmB_es2IvIHF-PVJuLJMPGFJM_1792643734
X-Mimecast-Originator: redhat.com
Content-Type: text/plain

On Wed, Oct 21 2026, "Michael S. Tsirkin" <mst@redhat.com> wrote:

> On Wed, Oct 21, 2026 at 03:25:31PM -0400, Demi Marie Obenour wrote:
>> On 10/21/26 14:00, Peter Hilber wrote:
>> > Reserve a device ID for QPSFI devices (Qualcomm Platform Subsystem
>> > Firmware Interface). QPSFI devices expose functionality across SoC
>> > subsystems through a common Virtio-based protocol. There are no plans to
>> > standardize the devices.
>> > 
>> > The Linux DCP display driver series is planned as the first user of this
>> > device ID:
>> > 
>> > https://lore.kernel.org/all/20261015-jshekhar-drm-msm-dcp-v1-v1-10-48aad0fe4f72@oss.qualcomm.com/
>> > 
>> > Device ID 51 is already reserved for the Virtio HAB device:
>> > 
>> > https://lore.kernel.org/virtio-comment/20260702140939.3535968-1-zeloren@qti.qualcomm.com/
>> > 
>> > Signed-off-by: Peter Hilber <peter.hilber@oss.qualcomm.com>
>> > ---
>> > 
>> >     v2:
>> >     
>> >     - Rename the device from "Snapdragon device" to "QPSFI device".
>> >     
>> >     - Refer to DCP Linux driver patch as planned first QPSFI user.
>> >     
>> >     v1:
>> >     
>> >     - Was posted as "content: Reserve ID 52 for Snapdragon device":
>> >     
>> >       https://lore.kernel.org/virtio-comment/20260826115504.1955-1-peter.hilber@oss.qualcomm.com/
>> > 
>> >  content.tex | 2 ++
>> >  1 file changed, 2 insertions(+)
>> > 
>> > diff --git a/content.tex b/content.tex
>> > index 243ce2dde36b..7416939e67d3 100644
>> > --- a/content.tex
>> > +++ b/content.tex
>> > @@ -805,6 +805,8 @@ \chapter{Device Types}\label{sec:Device Types}
>> >  \hline
>> >  50         &   Video encoder/decoder device \\
>> >  \hline
>> > +52         &   QPSFI device \\
>> > +\hline
>> >  \end{longtable}
>> >  
>> >  Some of the devices above are unspecified by this document,
>> 
>> I think it would be best to have a single ID for vendor-specific devices.
>> I believe most of the ID space has already been used, at least for virtio-PCI.
>> -- 
>> Sincerely,
>> Demi Marie Obenour (she/her/hers)
>
> Sounds like a good idea to me. And then qualcomm can do what they
> want, like check subsystem id for pci or whatever?
> Only issue is there is no way to distinguish for mmio/ccw.
> Maybe, add vendor specific id as first e.g. 8 bytes ro in the config space?
> Peter?

Using some information in the config space looks like the most flexible
way to me. Are we still happy with how the device ids are organized in
general (i.e. when do we want a new one, and when do we want to extend
an existing device?)

