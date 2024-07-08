Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6DA51DA303
	for <virtio-comment@lists.linux.dev>; Mon,  8 Jul 2024 10:35:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720434927; cv=none; b=E7xDs2/5lRfDpetGPvZQJnaknqz3hdKV5Kz+eKkq6GVYv14XhzaCXCTrbr45VE4N+bFPUqzPRyTha0NomoXyNHGLDOqvZ/LaX/RiJ08SXzOmOu8ssjgnG73UsijUwuSfTo7vwbMapUagvd99G1kFturByD1aH2tUx7c83S7lOuo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720434927; c=relaxed/simple;
	bh=uwNCxqliR/p4LPc6MVMoYwrP6iZKgogwPNiyRixbiNU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=O3qWbuypuGrm9MU3ca2NqrkbNSmTZN7ebyG09Rt+bt2H4+NFu17w8jlH1gYiOhRzv/ExVyt3HqR6yc1S/mf96ugDQYkN1yIqsfORB+sduictmDUoePRtV3nr9RZ4rqMj3dF9zwjYeRvb9Bvv1eOA97C28LBrM+OXJjsWAT6ki5I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=TcAjYzu5; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="TcAjYzu5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1720434924;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type;
	bh=N+uUYUPi3jT70+APhjsYhdoQrgjm83p3yULGflirMBo=;
	b=TcAjYzu5edQpwjC8JBrLwfH0AaKXIufn/WAIqKvMV9DZW5EMakPd/MCIUrJfpmt9EnSV+t
	nN+P9KQ653FDhuygR1uvJE6tz5/4tZWEjmcub6CUVPpeG8lqkkuJQJVehS+EmyUh1hTqhG
	vTSHRB+GwHVVmWzMJoYTPHB1vLipubU=
Received: from mail-yb1-f200.google.com (mail-yb1-f200.google.com
 [209.85.219.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-658-jEAYz_UlOtCpyUyb1rWqPw-1; Mon, 08 Jul 2024 06:35:23 -0400
X-MC-Unique: jEAYz_UlOtCpyUyb1rWqPw-1
Received: by mail-yb1-f200.google.com with SMTP id 3f1490d57ef6-e0335450936so7405941276.1
        for <virtio-comment@lists.linux.dev>; Mon, 08 Jul 2024 03:35:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720434922; x=1721039722;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=N+uUYUPi3jT70+APhjsYhdoQrgjm83p3yULGflirMBo=;
        b=XAIYJRatMlMXOu/B0fqEhaGkok2voxQiZsPwrA2STd1wlDAtvAHi6Oei6yX1fOfyzV
         JAnqKK6hbhvjJrIYh3R7O7si9dyQkjtSDBdfSxDNq1VHNwDn2lmjmxb+bJSNxcOoCTrd
         yuP/opjiNlniAPFjJnb5fJPzr/CuxYDaFp1rxHROOwioiitCopoQLJz7HBzDH7MdQ8E+
         mwNO+jpcgHzhHaXlruM6otK8KLQYtAQjekKmKncmAAKh62Z2KQ05zrNO9LPyL/oT//qW
         GenBlRen6LtLfCckTY4Q66cUbDjocWv7MLGaHOHfAfksi8B15TmN9Y3VvtOsRub3I8Y1
         YHtg==
X-Gm-Message-State: AOJu0YxR1884IzYmXpjGvVJkWZr/II1YsJrwTNWxmDRahQiuNdz0KR5G
	D2sI0qLQFDl4/d4ndeV/gPSiDkZ2w63J42uVvqE0+QEk72JfbqwWCx4+dYfMnPEnBYDv5VoaRX3
	XDKiG01t5TVtcFIr1vrH/yTceALHKWFNdUfc+ngtbvsoXPzvy9WXdxL2hbpYBDS98egnU7bujRx
	hSDtJ7pGk72A1vvaBDiDJKelFXhv9daMOpyNN4n0vP2iGNcvN9
X-Received: by 2002:a25:4cc4:0:b0:e03:4c07:2fde with SMTP id 3f1490d57ef6-e03ece592b1mr6044029276.40.1720434922546;
        Mon, 08 Jul 2024 03:35:22 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEjcknmi+s/IG6T63t6VaTlc4GsNmaN5zeeRzs+VjTz1KZ4cZGnHWi+Pljfz/OSNBX4v5J7yg==
X-Received: by 2002:a25:4cc4:0:b0:e03:4c07:2fde with SMTP id 3f1490d57ef6-e03ece592b1mr6044010276.40.1720434922193;
        Mon, 08 Jul 2024 03:35:22 -0700 (PDT)
Received: from fedora (193-248-58-176.ftth.fr.orangecustomers.net. [193.248.58.176])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6b60091e4f3sm27005276d6.66.2024.07.08.03.35.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Jul 2024 03:35:22 -0700 (PDT)
Date: Mon, 8 Jul 2024 12:35:18 +0200
From: Matias Ezequiel Vara Larsen <mvaralar@redhat.com>
To: virtio-comment@lists.linux.dev
Cc: harald.mommer@opensynergy.com, mvaralar@redhat.com, sgarzare@redhat.com
Subject: [PATCH v2] virtio-can: define out of rage can-id and sdu
Message-ID: <ZovA5gwG+rK0cRT5@fedora>
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

Explain when a message is out of range.

Signed-off-by: Matias Ezequiel Vara Larsen <mvaralar@redhat.com>
---
v1 -> v2
    * change to `if VIRTIO_CAN_FLAGS_FD bit is set`
---
 device-types/can/description.tex | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/device-types/can/description.tex b/device-types/can/description.tex
index 2511d9c..ddf259c 100644
--- a/device-types/can/description.tex
+++ b/device-types/can/description.tex
@@ -191,6 +191,14 @@ \subsubsection{Controller Mode}\label{sec:Device Types / CAN Device / Device Ope
 invalid state with VIRTIO_CAN_RESULT_NOT_OK in \field{result} and MUST
 NOT schedule the message for transmission.
 
+Note that the \field{can_id} field of a CAN frame is out of range when its
+length is more than 11 bits for standard frames or more than 29 bits for
+extended frames. The length of the \field{sdu} field is out of range when it
+uses more than 8 bytes for standard frames. If the VIRTIO_CAN_FLAGS_FD bit is
+set in the \field{flags}, the lenght of the \field{sdu} field is out of range
+when it uses more than 8 bytes and is not in the set [ 12, 16, 20, 24, 32, 48,
+64 ] bytes.
+
 If the parameters are valid the message is scheduled for transmission.
 
 If feature VIRTIO_CAN_F_CAN_LATE_TX_ACK has been negotiated the

base-commit: 37c6a406678a5ee891fdf5671298cb4fcfa517f2
-- 
2.42.0

