Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13D8C43AB7
	for <virtio-comment@lists.linux.dev>; Wed,  5 Mar 2025 05:51:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741153875; cv=none; b=LEbOZIlVkyUe1jCN7FhpmPvLusnejl9SjhjiLEajMrfTcd1OI6mE7eN6AzEVeYjQF8h/J78skTY8iEg9WGw1hJwb4vPp6ij+ZtIRa2RpE8BD677WxTI8JiEKoj/2UJFL3+lNatm0qLHgaweGLHglLyhrtpRKl2cCS6BvG5ND/Bw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741153875; c=relaxed/simple;
	bh=v4ZPVFjK0Zpf0Ywy2rT5FwrSdGMUu4QfVOVa63tbNRM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=kAeslm2aCWISX0nplcibP7V9qkXW42DYEW+ORNoyLyRNoNwdgkj6mVw5fdbpjl0gJ7doxXDK85oGU/hHlUuLYRAhKu4PPEGA8d4EDBXDmKBzKzquh/5CtCP/dyfyZDa9vYdwtWPVEKCfK/4GJJTshte/h4g9wSNRqd6Uat2W80c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=KQGik5pL; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="KQGik5pL"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1741153872;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=h3MnD0o7TtWnAO1zjPybOSES7sp+ncahr95809p0rE8=;
	b=KQGik5pLy/nZqTYY85Of+l++A6WFy+jlerV2k6/subAhgb9G3lupIGc6tmrZuCbFu92Ziy
	Ho9zPnl7lgH6vPa0/WnaXuRNOm/nGyygPBD3VEyV6OECKMEVdFnLsfkGSMOSs/+uN8tH2D
	OhB3iflPUhn3b8n2pRbEVMoFBYCmQCs=
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com
 [209.85.216.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-631-s9oWKa2zN0q2Ahc2VohkOw-1; Wed, 05 Mar 2025 00:51:05 -0500
X-MC-Unique: s9oWKa2zN0q2Ahc2VohkOw-1
X-Mimecast-MFC-AGG-ID: s9oWKa2zN0q2Ahc2VohkOw_1741153865
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-2f816a85facso12309927a91.3
        for <virtio-comment@lists.linux.dev>; Tue, 04 Mar 2025 21:51:05 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741153864; x=1741758664;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=h3MnD0o7TtWnAO1zjPybOSES7sp+ncahr95809p0rE8=;
        b=kwtmHxrA2vaK4iBQh9vfWgUUY2/fc1YgTJHw4qj2f0QXCxl9F6dnUkfFQ5g2XAVPx0
         RdEB3L1tdSSznmzqqPLfF/Jd1eNf7ZPEv5M+yjCzS79n8iuKjAOXn/6t3FjAIu4PoenF
         XJkP89DgSBAjpHiqbe+kf6+Ch+VPMiKtV+t3OFnAyFyIfiI4W/UrIrr/3glVao152Me8
         c6jsaq4sgDw5ysIFiS8UCKR1GwKeErvKhfbbQmQdIwENhed+y4PNJkg4Tblri8gEylbQ
         0WbiDRbNoARHvTKE5w+3YzfkfbZaXEW75QlEvcYoSPepvng3pUVbX5fycxwQx6Fv9reW
         IR0g==
X-Gm-Message-State: AOJu0YzK0ufnzlDwZzXZu4GIivKYm5mBQ8e4hXUfhhENxWWNcXOhzj9C
	6+E+WFHxj4dlGT/QMqNHPgr43UBFdOH8jkCsLstLLMH76rJB53HchBu3Jrj5FmooW4ddLL/1Cko
	dQNCE6Np5VhFW0c+qcD/NBhWBlg7/LT0Ot2neZw08P0Hg6Qn6MtRzSsfdMmMyd4vmcbrcNrgU0u
	YvFq/hXA+eOf+99Ca0zHs7GwziCqjELMRRELVTsXU=
X-Gm-Gg: ASbGnctG0gwkipiq8oDoxhfiRXVvFdt41RGcFpoXhT/Q4h0Aty1x5YvkjNOf18GaX46
	btB8I4AVF5k3oSZuNEpBDNUFY8tlLbEUKT04lhDwNJxq0x38FDRn5o35rKd2xIM9RjiRV8S4dbw
	==
X-Received: by 2002:a17:90b:2e42:b0:2ee:ee77:227c with SMTP id 98e67ed59e1d1-2ff4975abe0mr3168892a91.3.1741153864674;
        Tue, 04 Mar 2025 21:51:04 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGVvjlaDRwgupfdm2wYRmycf2R60HgTbRhk8Wf0xEV0Rs5dkGqDXg2QcF5VjRqb3f0ckt22SYbwQ35X4ue0Dfs=
X-Received: by 2002:a17:90b:2e42:b0:2ee:ee77:227c with SMTP id
 98e67ed59e1d1-2ff4975abe0mr3168867a91.3.1741153864336; Tue, 04 Mar 2025
 21:51:04 -0800 (PST)
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250222233040.29738-1-chia-yu.chang@nokia-bell-labs.com> <20250222233040.29738-2-chia-yu.chang@nokia-bell-labs.com>
In-Reply-To: <20250222233040.29738-2-chia-yu.chang@nokia-bell-labs.com>
From: Jason Wang <jasowang@redhat.com>
Date: Wed, 5 Mar 2025 13:50:52 +0800
X-Gm-Features: AQ5f1JrjMiJhhpBXDGRbIpN1BTtyVVN7dJ5Dhde87O0mj3rXRzDFByEW9joPU38
Message-ID: <CACGkMEvaUOqDUOgs8Guhm4iMce4qi=ThEeq_nkT674JzTBLJog@mail.gmail.com>
Subject: Re: [PATCH v3 1/2] virtio-net: Fix ECN feature descritpion
To: chia-yu.chang@nokia-bell-labs.com
Cc: virtio-comment@lists.linux.dev, mst@redhat.com, cohuck@redhat.com, 
	mvaralar@redhat.com, xuanzhuo@linux.alibaba.com, eperezma@redhat.com, 
	ij@kernel.org, ncardwell@google.com, koen.de_schepper@nokia-bell-labs.com, 
	g.white@cablelabs.com, vidhi_goel@apple.com, ingemar.s.johansson@ericsson.com, 
	mirja.kuehlewind@ericsson.com
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 1Eyl5mLyLKlIbNCgvvWWyCLYAUFs9z0hHpknhlGTOic_1741153865
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Feb 23, 2025 at 7:31=E2=80=AFAM <chia-yu.chang@nokia-bell-labs.com>=
 wrote:
>
> From: Chia-Yu Chang <chia-yu.chang@nokia-bell-labs.com>
>
> Clarify that the VIRTIO_NET_HDR_GSO_ECN gso_type flag does not mean that
> TCP has IP-ECN set, instead it identifies TCP CWR flag is set and will be
> cleared from the second segment. This is used to offload TCP CWR flag in =
a
> way that is compatible with RFC3168 ECN but is problematic for non-RFC316=
8
> use of CWR flag.
>
> Signed-off-by: Chia-Yu Chang <chia-yu.chang@nokia-bell-labs.com>
> ---
>  device-types/net/description.tex | 29 +++++++++++++++++------------
>  1 file changed, 17 insertions(+), 12 deletions(-)
>
> diff --git a/device-types/net/description.tex b/device-types/net/descript=
ion.tex
> index b546cd7..104a32f 100644
> --- a/device-types/net/description.tex
> +++ b/device-types/net/description.tex
> @@ -54,7 +54,9 @@ \subsection{Feature bits}\label{sec:Device Types / Netw=
ork Device / Feature bits
>
>  \item[VIRTIO_NET_F_GUEST_TSO6 (8)] Driver can receive TSOv6.
>
> -\item[VIRTIO_NET_F_GUEST_ECN (9)] Driver can receive TSO with ECN.
> +\item[VIRTIO_NET_F_GUEST_ECN (9)] Driver can receive TSO with TCP CWR fl=
ag set,
> +    which will be applied to the 1st segment of an aggregated segment an=
d
> +    be cleared from the 2nd segment of an aggregated segment.
>

Beside the question for patch 2. It would be also better to give a
link to RFC3168 in the "Normative References" chapter.

Thanks

