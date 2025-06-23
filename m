Received: from mail-qt1-f169.google.com (mail-qt1-f169.google.com [209.85.160.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E56C1FFC5E
	for <virtio-comment@lists.linux.dev>; Mon, 23 Jun 2025 08:48:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750668540; cv=none; b=SKO5PvO6lWOnldbO27t1Ml39zUGZBQ/sYH8FOw0zDiMo3YFQgcNnQVTgAB2cxYvdU6z5GsgfOKmsDAT1Wu4L5uWExwYBLB03XVPQ0RxmgCkP2/nE6qEXUILLqiKmZLnNQDDKihJWWhOQPAcysWfLyMjNY1UNYg0NeNzeQZEDiq4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750668540; c=relaxed/simple;
	bh=6P8G0/pKMf8IS9rTnoCcireF1fJR2bBSelxctYwmsRM=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=LmRJAu4e9/iyVV3lVKlxHW0dXbk/rnTDkS/iyJ0wa9mrGxouYav8qm68ptw8l5xvtxieOPrZl2nlZOR/x6Rx2pAVt4rj4X0peD347hs5diD1I+3ngF0IPDh2cM801GXJJs40TUQ0rHCAMYtPAfOu1JXxqfVIqfzwk5VeoTmHovM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=L3j3Aagv; arc=none smtp.client-ip=209.85.160.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="L3j3Aagv"
Received: by mail-qt1-f169.google.com with SMTP id d75a77b69052e-4a3db0666f2so95084221cf.1
        for <virtio-comment@lists.linux.dev>; Mon, 23 Jun 2025 01:48:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750668537; x=1751273337; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vXV1w5uQi1KJVnOwMUPSxKAfK9i+nGEJHC/zphfQnVg=;
        b=L3j3AagvWjSAOUgYp+nnfkMzDupXuon9OGpQ+duXE5VN/huQRM0JF/Twpuam/w8ipl
         +LV/S4bxeHbaw6WUOk9n1RCb4Mdn1uOjg6QwTsm9Yo+MSrjqH2ikCWNy8wqdkLlODdFg
         YOPFdTgJG7pxOR/OcxxhDXXX5Xf8tJ9mwr8kAMKiPP7NVpFFm80vEuKiORym0b4Gj9Py
         LM3l105Xd5MWC3cjOHV5kjAOAmj/dTfX3AoXjss+EPTJRbeSaM23l/zbG5VhweylRjji
         k9XBGDaYngNdMZt1U2Q7RKfGrobHVQd/6Ec48ei6GyTTiTht99GYFhwOlMAE881nMp8p
         9yKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750668537; x=1751273337;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vXV1w5uQi1KJVnOwMUPSxKAfK9i+nGEJHC/zphfQnVg=;
        b=pl4FjR6rQqRkOL+5nCwqemvprcRxgn+EocITv8DpMwEGRZzx4oytvifw/SiJyB+bCn
         wfzDP18S6L59AC7r8/AhYgN1ljVYbKc1AjT0vKFu79Hh3RwwrTDu1Vl8S6DOBzi8S8WT
         4s46yq8v7QSMwlX3WAcVSL3hvmdTofL+AgpQO0/HJb1W+3rvSQZgkhVQCAdzfrKPLfwm
         yK28nVvsAW3608NE8mdfsMKekFAeJ1yWc8a1H4tOuJuRvE3zm6qQk3ys7HUNBtmkWpGu
         uxgHBd9q6Jsv/aIU6tThIUXYaKWuw9xn1W1Bk2gVUvuLfUxIBtVnynV5ug4c5ZeSus21
         qSmg==
X-Forwarded-Encrypted: i=1; AJvYcCWl1QJpvMLVa6ByGlTzRi4p95zWK5/RSWd+KcLvRpnmLxUAwSp4cFJsvX/fZDbZ316B1y0+Cy8O8JhvKjbNQQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YxK/x6UvlLNdGAM9kgfALQR+WCW8jG2lREcZCTor3G+e9o/8Nq4
	dQG+T0CzADd1ohB5wklO0Tt9rXPW1qxapY5wbLyNhTZbk7SeIpyfXizPkTjMqwkp/a5cxu/4
X-Gm-Gg: ASbGncvirhrrgtZW9qvWKMoFUI9tev+NNp//diyx89cgz7J3ii1KAGs9feySlnJnUWx
	7jDjaKWLEERZGsXzX72nUKqjk024lkc14eTh2gb+0rWtlQruFpbra++mJgKhGugKm35+TBEbe6A
	/L1v7TPnrZQvhn7uQcgOry8YsQyKkD+wx504YXCa790ic318fmxfFNIAYvhF8DJVx4vNoagbOW5
	HEo39SxQVPzXQvcBrm+25VhNlomfglPKSScc6ujoQ9K74v8qglrJrEAtSVQ5VoK2xYdGqF0MCZb
	tkjP1CQPkaoFhIdUY6X3R2r2wIJM8SB/+2lSyEfT/mhwxp5Vt+hYq7VvySp+zupyUvv/scMgfiP
	vOPeaIPRs
X-Google-Smtp-Source: AGHT+IF8AdzHGeDf1PXgnk12TQT1o+IyKyt4s/xAUx0GnINqsmMjceRKur3Xn/tpsxeZU8LQDdPOjw==
X-Received: by 2002:a05:6a00:4f8c:b0:732:2484:e0ce with SMTP id d2e1a72fcca58-7490da9cd1amr22461405b3a.17.1750668524961;
        Mon, 23 Jun 2025 01:48:44 -0700 (PDT)
Received: from devant.antgroup-inc.local ([47.89.83.0])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7490a49ebd0sm7916192b3a.55.2025.06.23.01.48.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Jun 2025 01:48:44 -0700 (PDT)
From: Xuewei Niu <niuxuewei97@gmail.com>
X-Google-Original-From: Xuewei Niu <niuxuewei.nxw@antgroup.com>
To: sgarzare@redhat.com
Cc: fupan.lfp@antgroup.com,
	mst@redhat.com,
	niuxuewei.nxw@antgroup.com,
	niuxuewei97@gmail.com,
	parav@nvidia.com,
	virtio-comment@lists.linux.dev
Subject: Re: [PATCH v7] virtio-vsock: Add support for multi devices
Date: Mon, 23 Jun 2025 16:48:33 +0800
Message-Id: <20250623084833.1647215-1-niuxuewei.nxw@antgroup.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <ntpwwmwwaow4lfdjubgdwsvvpzpkuc52iz3vjztbx4iphvpnem@gmd2bsqckonm>
References: <ntpwwmwwaow4lfdjubgdwsvvpzpkuc52iz3vjztbx4iphvpnem@gmd2bsqckonm>
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

> On Thu, Jun 19, 2025 at 01:10:33PM +0800, Xuewei Niu wrote:
> >> > From: Xuewei Niu <niuxuewei97@gmail.com>
> >> > Sent: 19 June 2025 08:57 AM
> >> >
> >> > Hi Parav,
> >> >
> >> > Could you please take a look at the diagram in [1]?
> >> >
> >> > IIUC, for VM0, there are two groups, and for VM1, there is only one group.
> >> > Am I right? If yes, I think the group concept is reasonable but we don't need
> >> > at this time.
> >> >
> >> > I think the first thing is to figure out how to pick the right group.
> >> >
> >> > Standard socket doesn't provide a way to access the group information.
> >> >
> >> > Source and destination are from `bind()` and `connect()`, respectively. If we
> >> > don't call `bind()`, only the destination is known.
> >> >
> >> > However, only destination is not enough to find the group. For example, the
> >> > well-known CIDs (e.g. 2) are valid for all groups.
> >> >
> >> > 1:
> >> > https://lore.kernel.org/virtio-comment/20250618095139.1412138-1-niuxuewei.nxw@antgroup.com/
> >>
> >> Right. Sock addressing scheme is naïve presently to select the group. 
> >> Not sure when/how you or others plan to do.
> >> This is transport layer problem to solve (not to confuse with transport = pci/mmio etc).
> 
> 
> >>
> >> However, at device level, we should have the construct of grouping.
> >> Without this construct, all devices will be part of single group and one will not be able to build the group concept later.
> >> So even if you don't need it explicitly now, grouping the device is what you need when connect() is called.
> >>
> >> So I was imagining a relatively simple scheme:
> >> For example, virtio device level, some kind of group id is present.
> >> So two devices which has same group id, are part of single group.
> >> An example group id format can be a UUID.
> >>
> >> And this is completely optional for devices to implement.
> >> Generic enough and usable beyond just vsock device in other use cases 
> >> we discussed in past.
> >
> >Fair enough.
> >
> >@Stefano, could you please take a look at this? I'd love to have some 
> >input
> >from you.
> >
> >A brief summary of the idea is: The config space will be extended to
> >include a group id. The devices with the same group id are considered 
> >to be
> >in the same group.
> 
> Thanks for the summary, but please avoid top posting, otherwise is very 
> hard to follow the discussion :-(
> https://subspace.kernel.org/etiquette.html#do-not-top-post-when-replying

Sorry, I'll avoid it in the future.

> I like the idea of groups. What is not clear to me, is how groups will 
> allow the driver to select the default output device when the source 
> socket is not bind to any source CID.

Well, we did discuss, but we need your input.

I said in the thread [1] based on the standard socket API, the driver can't
pick a group. Parav [2] suggested that the group, as a basic concept,
should be present even if we are unable to use it.

IMHO, we might use "{group_id}-{cid}" as the vsock addressing scheme to use
the concept. But it is a very big change, leading to incompatibility with
the existing apps.

I think it might be beyond the scope of this patch, and would make the
vsock more complex. The current conclusion is that we will keep the concept
of grouping as a placeholder, but we will not use it.

1: https://lore.kernel.org/virtio-comment/20250613083633.1087589-1-niuxuewei.nxw@antgroup.com/T/#mcfa6ca71da3147930e3d4edcf3c1ef097f808d4d
2: https://lore.kernel.org/virtio-comment/20250613083633.1087589-1-niuxuewei.nxw@antgroup.com/T/#m3e97c051721f053da4d15e0c531c6f6c8ff38f60

> But if it's already discussed, 
> please go head and I'll check the next version.
> 
> Just a note, AF_VSOCK is suppose to be very similar to AF_UNIX. It's a 
> point ot point connection, we don't have any transport layer like TCP.
> What we call "transport" in AF_VSOCK world, is usually the driver/device 
> usend to send data (e.g. vmci, virtio, vhost, hyperv).

Thanks for the clarification, sometimes I am lost in the many "transports".

Thanks,
Xuewei

> Thanks,
> Stefano
