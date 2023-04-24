Return-Path: <virtio-comment-return-5616-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D357BC77B76
	for <virtio-comment@archiver.kernel.org>; Mon, 24 Apr 2023 22:09:02 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 3A0052A8DB
	for <virtio-comment@archiver.kernel.org>; Mon, 24 Apr 2023 22:09:02 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 319B098642D
	for <virtio-comment@archiver.kernel.org>; Mon, 24 Apr 2023 22:09:02 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 25ABD9863AC; Mon, 24 Apr 2023 22:09:02 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 12D559863A5;
	Mon, 24 Apr 2023 22:08:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=n9rNGNedHo+ZZJCZC5yIE5Wunj8EJq2mhK5lWjmHYAUNC9NobGTUErAVlaXKkE42gg4vG2BGYkz6Zy0Yncq1IEeT0QVjyfaOTey7jQug3UXRwBBIih1R5Q0WtkJ+dahNC7ybrdubPUpYyb+F+puTK2Z/Yy5Zw/4qxm1VpL/bga/xQ1i9qxS7ZBZbGqfeFbf+GRmduxq1xR8pEP78qQXQv0JRHjAtVe6WV6zs3xoYFaz7dHV4OE8k27oNYI1ccePjmSvfYsnf+nPvDOkDO8GW/Sd71SDUn7F5fx/Krz6ITUujZ35qaILNhsAbvq/olVeeTQEazsds907Bp3cud8S0eQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eX+0r4+zdsLpanGxwkxDwcCnHBLm040beMifk20RLCo=;
 b=MjMnPFjoFsXatGli2g+p/75m27PHTHDhYKpSzTWx8ee/TeDtI1xPWYmvDlODKFKq1gsWYoOZL+0SRWyVNOhtGY0sNyg6kY0ywkxAYUQ66nNrANHa6sq02gzAM7W1Pg71a4izlkkKxMsBGIivAdy/PTbIOwUB8xXqeVuy2J2TJTCLktLs5DORy30LjUl8eNAptml65VbuEKn8Dni1LAMVP+3THq+eX1Z5pZsnLQZc+OvAmLnJwk31/2AQfWGqWbr45DlsP2si66RwO+aqW3Tps1VjCcPEV2dDk6sWdEzcIUpYOrefpu+0oM9JgO7WEW+OFeWiDet68NbERDCADYkptg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Message-ID: <66eb18c8-506b-b5a2-69a4-7cfaf7ae702e@nvidia.com>
Date: Tue, 25 Apr 2023 01:08:39 +0300
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Content-Language: en-US
To: "Michael S. Tsirkin" <mst@redhat.com>,
 virtio-comment@lists.oasis-open.org, virtio-dev@lists.oasis-open.org,
 jasowang@redhat.com, cohuck@redhat.com, sgarzare@redhat.com,
 stefanha@redhat.com, nrupal.jani@intel.com, Piotr.Uminski@intel.com,
 hang.yuan@intel.com
Cc: virtio@lists.oasis-open.org, Jiri Pirko <jiri@nvidia.com>,
 Zhu Lingshan <lingshan.zhu@intel.com>, pasic@linux.ibm.com,
 Shahaf Shuler <shahafs@nvidia.com>, Parav Pandit <parav@nvidia.com>
References: <cover.1682354275.git.mst@redhat.com>
 <a67ae1170d9535a98862d01825b2662180d77d82.1682354275.git.mst@redhat.com>
From: Max Gurtovoy <mgurtovoy@nvidia.com>
In-Reply-To: <a67ae1170d9535a98862d01825b2662180d77d82.1682354275.git.mst@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: ZR0P278CA0182.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:44::15) To DM4PR12MB5040.namprd12.prod.outlook.com
 (2603:10b6:5:38b::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR12MB5040:EE_|DM4PR12MB5842:EE_
X-MS-Office365-Filtering-Correlation-Id: a7aeda4f-94a1-48e0-875d-08db45107b51
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	ZcoTiAK6w2Nmt0XD2Jn4tveqzcwa2rB5TcpEUBwIUYpEG6ydNg2RIYa5BTa+6fIK4qL87Q30fGVKu+1w3tqI38MsVZS/z5ya5nKGuIM4EKQVpa+BZ2Cg/jnDFyvDjfSRQqe5QweSCLUqSGXbyPfYch26G8MLLdt0H48i0Zv09e6h8MIhQYSgqa7GcDrjpwaiyI/ctg5gckFjsCLkXzJH7lQmGd1b8/J2y0fcAOdjyok9LJZiPT3gmeJ7PHnIb2qqEjTp47DKnAKfO3JwRZ9GjF8RK1hWCLVW9zET1lxKbNM8ERyijygKtgpqb7c7fX0xjg5h5H/oiX0JJ5AybZvxWCxsZYHDOETovJ8gDh3k9jk3CSjj4M4pIu3MlKihoXOKdgdabVR7OKukCCwxrqzpEJD7D2uZu/tOZlSELMHopN8PWGlyNJRE7SOytdPh84Pam73ozBZtYFIEwwITfK70CL7/15DAnp4XaoB9fpzT0+OF2iCTMOo0pArh+3YY/NSEpjHAdmPaLl4+hqJo5iYfY6UGojrZjDARiBAGWtOKXVN/wpgQHpMNilxn4sQ4u80NRzALjh0SyrHr5qMtET2YKlar/Vk4iQDkZyPmQOZtX7IyMEgyoCHkVftW7HaaHnU/nn1NZDJEqHiNgyscv32fd76zeP4EL8rrA9s5jlktSQ8=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR12MB5040.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(39860400002)(396003)(376002)(346002)(366004)(136003)(451199021)(38100700002)(921005)(6506007)(6512007)(53546011)(26005)(2616005)(186003)(8936002)(83380400001)(107886003)(7416002)(2906002)(8676002)(5660300002)(36756003)(478600001)(54906003)(6486002)(316002)(6666004)(4326008)(66556008)(41300700001)(31696002)(66946007)(86362001)(66476007)(31686004)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NlYveUNZVXdJVkxpVUJNclcySjBUT3RZendIODNkSGxxbUJBTVJPYW1qdjRr?=
 =?utf-8?B?SDNXWVRENWE1NU8xczUwdy81U3BrNkh0STh6YkpzOHdyYUlRaEhUWVgweldh?=
 =?utf-8?B?NmNjY2Uxeng1T1BQazV0MnNpUTdVK0M1SDhTdDFSUVNUMWwzTjdMU1FRejhM?=
 =?utf-8?B?b0xyREVXWSs5TkhFam4vdVVOS3ZqYzlwbVMwbHRZUWh3ZmpBejFXTDFiM3Fm?=
 =?utf-8?B?QkNwbHRpNE1KdlRqTS82OUg0cWxkM0Qyd3BSQUtrUnBWNVdMTTRiQ2JuK0ZQ?=
 =?utf-8?B?UkhrOFk0S3FwQkw1eGJmN3dXMmhzZWpjM1lrbjk4QkRtNnpkNkRLM05Pb1RT?=
 =?utf-8?B?UW5VcENJVUZiekk1dVlSZ2dWNXlxQ0RadXgweFpzdlFxcFgweEpMRGFBd3BB?=
 =?utf-8?B?S3FwbG50VkxuM1F1eW9XSnVZNUg1RW9SMmVvRmNVZ0xiTDZEalBIcWNpYWVJ?=
 =?utf-8?B?V0lNT0FuSjQ1S1VVNkNBWDFZKzlKaUUxaWVEZ2VCRUVFU29jQzlDK2Q3REhO?=
 =?utf-8?B?ZVdvbzV0Nm8zTjJuckU3R204SHlZd3ZaWnlLcnFHNklkMmtXZVRva0p1UmJQ?=
 =?utf-8?B?dFBSTWVVNEJvUmtQVFptWjJoWHU5THV0a09kZHFqN0tyMFZyZ25VNEUxK205?=
 =?utf-8?B?UjFad2NQUG44SzF6bzdGdmNGczdzNnFJQWZHMnNlR3BIQk1sdEtOUzN2V0Ra?=
 =?utf-8?B?TlpDZWVGdmJGQXpoN0JVSmJZSzUwSVJTamxvazRKQlEyK1dnbXFNdFRKTEFF?=
 =?utf-8?B?TWdNQ2U4czZvV3hwUUdmcnM0dWlId3dxOVlTUVRad05YNmZUeDlxVHkvaWRG?=
 =?utf-8?B?bXRBVEoxMi9VdlFpWWh3aitlZnhMLzVnSWdycy8rV3lSajdvUFc0cytaaWJL?=
 =?utf-8?B?TU5xblN1LytidFF5dXNxUnVGaFFwd2FhOXJvdzlXa3ROYW8wSFkyaHJBRXc3?=
 =?utf-8?B?Q0lHeUZweEFwRlpVTWJqSUZMblhUYnlFN3ZTckQ2WlFldFVNakxVS3BySFFK?=
 =?utf-8?B?TDI5SVhyUDhKb1Z2VGpKQXhsUzFGczdNaTlNTXhKS2owd1pWdFVqMFVwU3p3?=
 =?utf-8?B?dTlYMStGVnFGWGZ6SWo3b1VJWU9wUVc0c215bS8yVmdkVW5FRFZacTYwYUdW?=
 =?utf-8?B?bTN4T0R4WlFVZ05UR0R0amFuNXowbmgrNjQ3V3pxOVRxWi9SbWhUYUdlY2w5?=
 =?utf-8?B?MTkzRGFMQ2phdmxYUUV3c09sb1BVRU14OHN0SUpnOEk0ZUFrSi9LRjZtVjdW?=
 =?utf-8?B?QWd3WVlHWVNZcHBPYXRSN3pVOUx0VmNIOCtUdVUya0I0Wm5zOXNWTHhnZHlV?=
 =?utf-8?B?WXcxZDdvaDREVFJ3cms3Tnl0K1BYanpWblptckMveSs2VXZ3YzdDWmplS0FT?=
 =?utf-8?B?dGxEbVg3anBZU0VENUM4WEpGQnlNNTllTzJCWmpON3liWkZDR2FsdnB5b2xl?=
 =?utf-8?B?VkY2c2puWjY2NkRianJ2WE9GUHp6a1E0K2VtYVVHMmlQRUhWaWV5VkhTWDNP?=
 =?utf-8?B?ajVhYlNDVHBXK1A5WG9jM3JHUUR3VkxiLzg5anlYWDZxOUkvSjZuZC9kT1B3?=
 =?utf-8?B?bzI4ck1aemEzSkVYcjZVV1duTmxSYjRiaWtBcEFYNmIvQmMvTW16NTZYV2tJ?=
 =?utf-8?B?ejZtbzJDWlFBdmtsUFlEbWoxd0lBUmRrdTc3RXhMOFQ4SlluYWl6cW1vdk1F?=
 =?utf-8?B?ZUNDbHFLaDV4NDdxL2NHSXJORFYweURXN0RlMTBXODJrSUpxWUl1Zk1CWEcz?=
 =?utf-8?B?S1JxL1JlMVpJbTllTnlCZXZOTHlwUVNyTExWMnAxVGVEdHpvNnJVREM0bWlZ?=
 =?utf-8?B?dDVXcXFEaU9rczY3b2dFTmN0emo3RkRTMDlMMEsyOThNWXZPU2QzSnljc29p?=
 =?utf-8?B?ai9scEVMcno3ZlZxNHlPUlk2UXNSa01QN0dlMFp4RUIvRGdXOTE5TTc5Y2Uv?=
 =?utf-8?B?eG41MEFxdCt2ZVhQZWhFZnBWRG5hWVpiN2Q0N3JuRmR4RDlQdEJhRG5GNm5V?=
 =?utf-8?B?R2MzUkdWcis4Qm5YNUR1VG12SEV5WDlpVzlDdTZWeUU1QlM5YWJ1dUI2dFc4?=
 =?utf-8?B?ejBieE5BRFRTOEJFOVl5U0lNQU02YXFVZXNWMnlMNlJNQTBGKzdPZmdSczl5?=
 =?utf-8?B?d29HQ1dXU0FGa1krMzNIZnVkTzh6MVRHT1lsa3lhaTZEL3pyUENYNWhwa0Ey?=
 =?utf-8?B?Nmc9PQ==?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a7aeda4f-94a1-48e0-875d-08db45107b51
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB5040.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Apr 2023 22:08:49.6288
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: D4VOUPTc5/yngpz6VHIGD+J4ZKhq3Yuzoso+03QuzUVtq6Zq6q5CbF8v2/dpeKfkhz5J6eK3NxOqYdn7TY6FPw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB5842
Subject: [virtio-comment] Re: [PATCH v12 06/10] mmio: document ADMIN_VQ as reserved



On 24/04/2023 19:44, Michael S. Tsirkin wrote:
> Adding relevant registers needs more work and it's not
> clear what the use-case will be as currently only
> the PCI transport is supported. But let's keep the
> door open on this.
> We already say it's reserved in a central place, but it
> does not hurt to remind implementers to mask it.
> 
> Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
> Reviewed-by: Parav Pandit <parav@nvidia.com>
> Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
> 
> ---
> 
> changes in v12:
> 	drop "as of now" to address comment by parav
> ---
>   content.tex | 12 ++++++++++++
>   1 file changed, 12 insertions(+)
> 
> diff --git a/content.tex b/content.tex
> index bcbc06d..7d6d9c4 100644
> --- a/content.tex
> +++ b/content.tex
> @@ -2365,6 +2365,18 @@ \subsection{Legacy interface}\label{sec:Virtio Transport Options / Virtio Over M
>   
>   Notification mechanisms did not change.
>   
> +\subsection{Features reserved for future use}\label{sec:Virtio Transport Options / Virtio Over MMIO / Features reserved for future use}
> +
> +Devices and drivers utilizing Virtio Over MMIO
> +do not support the following features:
> +\begin{itemize}
> +
> +\item VIRTIO_F_ADMIN_VQ
> +
> +\end{itemize}
> +
> +These features are reserved for future use.
> +
>   \section{Virtio Over Channel I/O}\label{sec:Virtio Transport Options / Virtio Over Channel I/O}
>   
>   S/390 based virtual machines support neither PCI nor MMIO, so a

Looks good,

Reviewed-by: Max Gurtovoy <mgurtovoy@nvidia.com>

This publicly archived list offers a means to provide input to the
OASIS Virtual I/O Device (VIRTIO) TC.

In order to verify user consent to the Feedback License terms and
to minimize spam in the list archive, subscription is required
before posting.

Subscribe: virtio-comment-subscribe@lists.oasis-open.org
Unsubscribe: virtio-comment-unsubscribe@lists.oasis-open.org
List help: virtio-comment-help@lists.oasis-open.org
List archive: https://lists.oasis-open.org/archives/virtio-comment/
Feedback License: https://www.oasis-open.org/who/ipr/feedback_license.pdf
List Guidelines: https://www.oasis-open.org/policies-guidelines/mailing-lists
Committee: https://www.oasis-open.org/committees/virtio/
Join OASIS: https://www.oasis-open.org/join/

