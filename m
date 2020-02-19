Return-Path: virtio-comment-return-1067-cohuck=redhat.com@lists.oasis-open.org
Sender: <virtio-comment@lists.oasis-open.org>
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 3042C985EAA
	for <virtio-comment@lists.oasis-open.org>; Wed, 19 Feb 2020 12:27:18 +0000 (UTC)
References: <20200219075337.23191-1-yuri.benditovich@daynix.com>
 <20200219075337.23191-2-yuri.benditovich@daynix.com>
From: Jason Wang <jasowang@redhat.com>
Message-ID: <86420fd1-cbb4-0105-4114-ca2d6cb3b8ff@redhat.com>
Date: Wed, 19 Feb 2020 20:27:10 +0800
MIME-Version: 1.0
In-Reply-To: <20200219075337.23191-2-yuri.benditovich@daynix.com>
Content-Language: en-US
Subject: Re: [virtio-comment] [PATCH v4 1/1] virtio-net: Define per-packet
 hash reporting feature
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
To: Yuri Benditovich <yuri.benditovich@daynix.com>, virtio-comment@lists.oasis-open.org, mst@redhat.com
List-ID: <virtio-comment.lists.oasis-open.org>


On 2020/2/19 =E4=B8=8B=E5=8D=883:53, Yuri Benditovich wrote:
>   The device MUST set \field{rss_max_indirection_table_length} to at leas=
t 128, if it offers
>   VIRTIO_NET_F_RSS.
> @@ -3195,6 +3180,8 @@ \subsection{Device Operation}\label{sec:Device Type=
s / Network Device / Device O
>           le16 csum_start;
>           le16 csum_offset;
>           le16 num_buffers;
> +        le32 hash_value; (Only if VIRTIO_NET_F_HASH_REPORT negotiated)
> +        le16 hash_type;  (Only if VIRTIO_NET_F_HASH_REPORT negotiated)
>   };
>   \end{lstlisting}
>  =20


A question here:

Consider we introduce VIRTIO_NET_F_FEATURE_INFORMATION in the future:

le32 hash_type; // VIRTIO_NET_F_HASH_REPORT
le32 feature_information; // VIRTIO_NET_F_FEATURE_INFORMATION

What happens if HASH_REPORT is not negotiated, I believe we expect a=20
stable ABI(offset) here for feature_information?

Thanks




This publicly archived list offers a means to provide input to the=0D
OASIS Virtual I/O Device (VIRTIO) TC.=0D
=0D
In order to verify user consent to the Feedback License terms and=0D
to minimize spam in the list archive, subscription is required=0D
before posting.=0D
=0D
Subscribe: virtio-comment-subscribe@lists.oasis-open.org=0D
Unsubscribe: virtio-comment-unsubscribe@lists.oasis-open.org=0D
List help: virtio-comment-help@lists.oasis-open.org=0D
List archive: https://lists.oasis-open.org/archives/virtio-comment/=0D
Feedback License: https://www.oasis-open.org/who/ipr/feedback_license.pdf=
=0D
List Guidelines: https://www.oasis-open.org/policies-guidelines/mailing-lis=
ts=0D
Committee: https://www.oasis-open.org/committees/virtio/=0D
Join OASIS: https://www.oasis-open.org/join/

