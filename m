Return-Path: <virtio-comment-return-6122-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F6C4C77B73
	for <virtio-comment@archiver.kernel.org>; Mon,  5 Jun 2023 02:40:59 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 819AC444C
	for <virtio-comment@archiver.kernel.org>; Mon,  5 Jun 2023 02:40:58 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 716769863AC
	for <virtio-comment@archiver.kernel.org>; Mon,  5 Jun 2023 02:40:58 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 68972986339; Mon,  5 Jun 2023 02:40:58 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 58A2C98633D
	for <virtio-comment@lists.oasis-open.org>; Mon,  5 Jun 2023 02:40:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=F49GlYO6fW636TmO/bhV0kAqiZ7OF66ZUv8U9TPsCPP8xZOJ3PscQWrNJUqLEF96U8LLvGub+0X35nW6/LINZN1U0WsOQeyXEVa8WrUJqPk0C/apbi6CpiVGBzB8XO+DNp6zDOW3uypGRdgD3xzjUpRd2Bq7loa7Yn7WCa/pMeN3XuZNWD0REoOCWEdDXWHDrGxMZP9UxcYSE0tAu072JaknWhbKKmp4RsW2yTpxLiPnMV3Lv0Z/pN/nfFEbrjzX1SzpotYJ4pJZ7BaqF6YEBsaHlFeI1RYY5cxgjmRHoVS/KoMSc8Y7UnhtEea++w+CQM3iHn1Nx3CMoTBjY1e2ng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZNOYpMKDx0n1seGpZy3yQvGFzSydCYXhsIgNlW6HuQ8=;
 b=WR5XSqypZ/8JS900EzmemKtg7x2AQdGPl/FXL8li1bhoQCJI180TY/pZ+5xHU7wGGdS6vj2N0gHP9U89Y2q56aBG5TzBMiW6gbm4xc4Gv4Zvyg6TdmHG5n2hyi9PeFPMP20RRWh/vR44MnZ3lz2WWpuH/DCSEa1UpOGgTky4UKSmR46b/a4nilws0j5PfVd/7mQR6JzV4s3dbFJz1okHSouon6f8OWR9e9dhRnQZ3vOBkTQATlZlIqg9Cx5Z/0DIkURu+fNt9kukB7VLr/pRROwE4O9TNSEo5Sy5yR6tDXWvO9wq3nfyfR5zT1TOdVsVvqsASQNAUU/SGuek1F6+Tw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Message-ID: <0e361e17-943d-5b03-1963-6dddbe6ff2b9@nvidia.com>
Date: Sun, 4 Jun 2023 22:40:54 -0400
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
From: Parav Pandit <parav@nvidia.com>
To: zhenwei pi <pizhenwei@bytedance.com>, mst@redhat.com,
 stefanha@redhat.com, jasowang@redhat.com
Cc: virtio-comment@lists.oasis-open.org, houp@yusur.tech,
 helei.sig11@bytedance.com, xinhao.kong@duke.edu
References: <20230504081910.238585-1-pizhenwei@bytedance.com>
 <20230504081910.238585-4-pizhenwei@bytedance.com>
Content-Language: en-US
In-Reply-To: <20230504081910.238585-4-pizhenwei@bytedance.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BN9PR03CA0072.namprd03.prod.outlook.com
 (2603:10b6:408:fc::17) To PH0PR12MB5481.namprd12.prod.outlook.com
 (2603:10b6:510:d4::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR12MB5481:EE_|CH3PR12MB8754:EE_
X-MS-Office365-Filtering-Correlation-Id: 8cbaf09b-fddb-4c55-ae79-08db656e4953
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	zvAJlOQkhZcw04VwbMjRHkcW/g/2iQ8kdtN1f0MIwqcX8p1nZf/3LIqVcOc1a1MXUiq7oiij0pM2fBsjfzoIDt6BUh5cfc3qdTeA6NPno8jzidVPEx5CvGgvk46767LhiFci4L5RTCGFZVWBhGgC86mVHC4zjQCnNktfml7jc1p+lceBGAFMs2fo1uQwB71+c+U73UvU47CtpZ/rQoSKMWLS1pFno34x8O7E1I0vFCL8DcQ2u/f7eKALnO2Fs7KQXXpPLMl/pyL/tHkbByDqWaHrSpLSHgnSULMoKyy2XHO6o3fQSt2EnvzYatu52tB8Z9lGIeNcpe3Hyk5t7ScFNQand+Xe9r/FGb4VUqaocAyBw+won8D/+X6XNdEmPWO97mJZWUzcV/WGGll0EDGdIPa5NWZ8wTVfY0N1EjJGsi+qKe6hUSY8ZRdtlsxSCfDECcCPKxb70D9B2URbLBrZTIemBE7PXgvkqVoiDRC/AoVZEL0dIGJPLBimYSkSgLWGMoAatwF2bX5HQQRsTA8mu0cJDD1SermpWjRTlRt7v1sDLLk0N1RmjT5UZv+QmiSjkSu/8/m4qjt0Na834WwVFBkvjBxBbJhCnrRDKc4sxedHIOK/xZO9k8eb+3uD9spe/Wgox6F6ZUHqwULaUcf+6Q==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR12MB5481.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(136003)(366004)(39860400002)(396003)(346002)(376002)(451199021)(53546011)(316002)(8936002)(8676002)(6512007)(66476007)(66556008)(41300700001)(478600001)(38100700002)(4326008)(6506007)(5660300002)(66946007)(31686004)(186003)(83380400001)(36756003)(2906002)(6486002)(2616005)(31696002)(86362001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?WTlGazVvbXVRVG8xa1FqaUlKWjIzTVZGZmpINjN3aGlkOWFNZnlyZWpDN04w?=
 =?utf-8?B?L2I1eXBzc3lyOG03U0dSa2RJUE9rdWFlMVlXWGwrNEcwRE8rajN4Rlg4dklu?=
 =?utf-8?B?Kzc3ekQxOXV2eElQQThUQzg1clBHTFRJaUt4WFNuNVFJUmpmbW5sdjFOR0J0?=
 =?utf-8?B?cTZuaUEvZVhqd2l3dUt1RTdFR2xaQ3lQVktmWTZ5bzFacTlNb1l3Z0lEL3ov?=
 =?utf-8?B?U3NUSWNHaDdBUmtYdjdJSWVqK1FNeWR1Rnd3OFVwN0d0L2hLR1Vmamh4TVFL?=
 =?utf-8?B?cXpyNUhhSHEwblRVNGdmZm1CY0c4NFZUNWdwZjN6TDVFSEh6emxBb1doc041?=
 =?utf-8?B?YWdMWXBlSG9ic1Zyd0VaUTh1RGJWcGpQd0xCRC9hVzhMR1VRY1lMdEMwZ0Ns?=
 =?utf-8?B?WTVYWW5ORjY4bUl6VHZSWm04NndjdzFqTXdVNStTTUNuZ0JJeTdNS0VIS21Z?=
 =?utf-8?B?ZHV3VjFrZ3FzM3pUb1hhUUdOajdzWGxBd2VjMkdicE8xbWNtOGlBRnVYS041?=
 =?utf-8?B?N0wxaURVUmJXZVBMUjRyWGFmQStHc3hXaTUyaXZIVWVXTTJnTTV1WGU1K0s3?=
 =?utf-8?B?K2x6b09pY3lOUEJML3hjcmNRU2ZTZlBWRzlNQ09YZnZNYkFHckJibHVGYmhL?=
 =?utf-8?B?S2Z1MW1vZ1NVaTZrOWhjVmpZSDlXbmhXQzFRNDgybUplanp5ckZrVGMvRWdS?=
 =?utf-8?B?US96dXJsRi9jelh2cVJaUFNVZGhvTkc3ZmU5MzhURXdmVnNLUmZmZDFMd1dP?=
 =?utf-8?B?b3BrdGdZVmhySDFuUWk0UEMxeVk1Y0huMndVYlFoSEdrTElRSHdOUXlCTEV6?=
 =?utf-8?B?WGwzWjJLSlZydWFJeDcrN2J3OHpNNjFlNnFHb1hvZXVweENjbk5IOVo2aFRq?=
 =?utf-8?B?NTc4VXFaQ1N1SkRLZGJTeEdZN2JRYWVVTUg5S3RYSGFENE5tOThYSDNnVzZJ?=
 =?utf-8?B?R3JYTjRzQlprbXJvV1NpUndkbmcyYmRwUmRIdVVGeFc0VFhteUI4NVF4YU1Z?=
 =?utf-8?B?bUpJZ2lRNlNXUTFYQkZJMGdkbjB3dHlaVzltY1gwakFWcktpeFp5SjF1K2R6?=
 =?utf-8?B?dVZycnVvNTlsWTk5L3p0SDhWM2Jhd3BIUm1JVmh1UVNWTlNHYitQSTFOdzJy?=
 =?utf-8?B?VTVQbkRFVHJMVlZTUUZ6dU8xRk9qY2oyRDBmYUowemd2cE5lUFg5WU5vWFox?=
 =?utf-8?B?SU9LYktYOUdYYml0aHA1UmVjRFZ4TkFTZHNMM3dNd2c4WUQ0QTNyUnRHTlh4?=
 =?utf-8?B?TUJMcnkxQjIxa2NhS2YyRjZZVEMxTGdwZW9kZTVFdXFoc3JISkF1eERyMzNp?=
 =?utf-8?B?RFZsVEdpZUJxbzhRNGU1bms5cDRESmM0aURKZVUrTktPL1JCdUd0S1NWeVU4?=
 =?utf-8?B?RUpyNUhybkFZcWVjRkhlVFNzaCtBWThPZWM4ZFEzVS9VbzM2Q2ZINVJ4ZU9Y?=
 =?utf-8?B?V2RlZU1rOWovU1YraFdFVURCbm1RellVeDdKWTVkbHFnMG80T3YxdEpFR3Ro?=
 =?utf-8?B?eTNZTnQwaWNLUXFGanNjelRBeldtNi81V2psREdpNGs3c1l2ZEd0TkNIWVQv?=
 =?utf-8?B?dGdqMnJSVi91Z3BTbHdlK2l3VmFRWm83blh3UnFOdTF0dWtSZW94SnUyT281?=
 =?utf-8?B?aUZWRVZUclI3YUFnR1V4TGxIOGdndUdILzkwbHdCQ1ZpbGVjUmNFZ2d4TFNo?=
 =?utf-8?B?Sy9nVXQ5bi9Hd2FXZS9ibTJrOVorN3NQWVprSm1uNFJnWXpVQTQ5R1h6MWVh?=
 =?utf-8?B?VmZsNWxJb3FsWkhXUWZjbDQ4bHlVVXV6WHNhWTRhSTdtczdiNnlWbWxLdURB?=
 =?utf-8?B?RHgvUkl0Wm5VbVZtVENuWHUzM2RiOE5mbndsWllXdWxyK2t6ajRMNDlacnNX?=
 =?utf-8?B?Tk4rVG1vU1VpMkxEWGtYSWE3Wm84N2l2bGdhNWY4TWVSd3ZUd1VBQnRLUFd5?=
 =?utf-8?B?Yk43c0dYUngwbWFkNTF0OGJHN3lrbVFxWmJMbXA2d1JFZis0RGNNOGRIZU5W?=
 =?utf-8?B?Z1ZITjNkdFdRdndkYlZXN2IwUkdJYTRLN0FMeFBQd3pPakJWS2M3cTAyaVV5?=
 =?utf-8?B?bldramV1b2twcENsMmFFeUV3QUZxVDNEMGJvM2RSaEJXOWVoUWxIQzZtVlVD?=
 =?utf-8?B?amFPQWJpSU5FYnlQaWJTYVFUVkovVXhKMkFQWklXQ2ZPQ2trTStZYVk2Vm1z?=
 =?utf-8?Q?XtjNF2HengUPficn1KGBLfjgkwP4Fzk8ASrefo3lgtDy?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8cbaf09b-fddb-4c55-ae79-08db656e4953
X-MS-Exchange-CrossTenant-AuthSource: PH0PR12MB5481.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jun 2023 02:40:55.5605
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Y5eneyabOMb1ThWsYO0LhsFGV0JCRq+vDrRD04Mnl7XKKpEb7IGrl7mBfjvST66/TinuryhttiObxHs+pbR6ig==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB8754
Subject: [virtio-comment] Re: [PATCH v2 03/11] transport-fabircs: introduce Segment Descriptor
 Definition



On 5/4/2023 4:19 AM, zhenwei pi wrote:
> Introduce segment descriptor to describe the Virtio device buffer
> segments.
> 
> Signed-off-by: zhenwei pi <pizhenwei@bytedance.com>
> ---
>   transport-fabrics.tex | 43 +++++++++++++++++++++++++++++++++++++++++++
>   1 file changed, 43 insertions(+)
> 
> diff --git a/transport-fabrics.tex b/transport-fabrics.tex
> index 26b0192..b88acfd 100644
> --- a/transport-fabrics.tex
> +++ b/transport-fabrics.tex
> @@ -45,3 +45,46 @@ \subsection{Virtio Qualified Name}\label{sec:Virtio Transport Options / Virtio O
>   \item The string is null terminated.
>   \item There is no strict style limitation.
>   \end{itemize}
> +
> +\subsection{Transmission Protocol}\label{sec:Virtio Transport Options / Virtio Over Fabrics / Transmission Protocol}
> +This section defines transmission protocol for Virtio Over Fabrics. All the
> +fields use little endian format.
> +
> +\subsubsection{Segment Descriptor Definition}\label{sec:Virtio Transport Options / Virtio Over Fabrics / Transmission Protocol / Segment Descriptor Definition}
> +Virtio Over Fabrics uses the following structure to describe data segment:
> +
> +\begin{lstlisting}
> +struct virtio_of_vring_desc {
vring doesnt seem necessary here.

> +        le64 addr;
> +        le32 length;
> +        /* This marks the unique ID within a command, no limitation among inflight commands */
> +        le16 id;
id and key both seems redundant.
Not sure the need of id in each descriptor.
Yet to read full...

> +        /* This marks a buffer as keyed transmission (otherwise stream transmission) */
> +#define VIRTIO_OF_DESC_F_KEYED     1
> +        /* This marks a buffer as device write-only (otherwise device read-only). */
> +#define VIRTIO_OF_DESC_F_WRITE     2
> +        le16 flags;
> +        le32 key;
> +};
> +\end{lstlisting}
> +
> +The structure virtio_of_vring_desc is used for both keyed transmission
> +(i.e. RDMA) and stream transmission(i.e. TCP). The fields is described as follows:
> +
> +\begin{tabular}{ |l|l|l| }
> +\hline
> +Field & keyed transmission & stream transmission \\
> +\hline \hline
> +addr & Start address of remote memory buffer & Start address within the stream buffer \\
> +\hline
> +length & The length of remote memory buffer & The length of buffer within the stream \\
> +\hline
> +id & The ID of this descriptor & The ID of this descriptor \\
> +\hline
> +flags & both keyed transmission and stream transmission supported & stream transmission only \\
> +\hline
This is probably transport specific, don't see the need to transport 
this bit when the transport type is already known as keyed.

> +key & Key of the remote Memory Region & Ignore \\
> +\hline
> +\end{tabular}
> +
> +Depending on the opcode, a Command contains zero or more structure virtio_of_vring_desc.
Please move above opcode line patch to different patch where opcode is 
introduced.

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

