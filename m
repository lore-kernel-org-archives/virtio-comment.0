Return-Path: <virtio-comment-return-5614-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD887C77B7F
	for <virtio-comment@archiver.kernel.org>; Mon, 24 Apr 2023 22:06:17 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 06B1BEEA1B
	for <virtio-comment@archiver.kernel.org>; Mon, 24 Apr 2023 22:06:17 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id D53D998643D
	for <virtio-comment@archiver.kernel.org>; Mon, 24 Apr 2023 22:06:16 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id BE335983F7A; Mon, 24 Apr 2023 22:06:16 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id A9B669863A5;
	Mon, 24 Apr 2023 22:06:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UriWmrKimDRSEnQLjZi6oj+AKi2dfJ7qGrFneEFkfct0Yn8GkKSPmQd1omT7dMt8BbV63z7FBPJh7hRiRjXGN1HQVz1SXLCh5cPRXlzDn1tCYZb+9sEH8ZNprHY4/ffQKMJCZMX8+oIFbU76SNcrZcFjRi5XIhT1MIEsLdZ8PNHih65ohUeITV1TDJTG+cnDvHAy+1/Uh88bmLu25F1snMpzw26E0+GqZ/c5o+pF9rz3A6TaVxib+Re+SFzcedxaIrcHSLF+cKr9w6Ik3SWyghzn7MbA2gsvPSEN7kkpk4PaK+L2LMa2gxBhcjrFNoscrh+cbTd0LBI4sN0Xd8JfGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CJkjL4mbF/7n2GBJBkXFQ7xmrvfVyqrdeKhFkzg7roE=;
 b=e2XWFupl1Da9F78iCkQ0AneCGpZ6q4B9za1oJMPBecEbzbZWaw9P2XW6PQKng/kmN+vW9F/XegbHhvrLY2lrv8BC2I2tr1zYJ7lrKYRavleWT2/r8bjylJlKvP5UaTbM6fmu2zEGek3faM+atHAR84wVEfx5grcuArkIfQEteJ4UGeiNt8bAJbRTk5/0s2plczFoXee/QKum5UCC5uooKifCZ810dZ3Bx059MpNF8Tx4caprUdg3S9JMrjBLr3PGoJqr1o4BPCXTpFHoGvR9MTiU6/UDXEYxyC6KCmOvPYGEpyyRkfmG+ejZ8pBBoqk/cQc7mF1TGpQnsUStkiIGZA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Message-ID: <5858e2e6-0b50-c155-85e9-eea6dfb533e1@nvidia.com>
Date: Tue, 25 Apr 2023 01:06:02 +0300
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
 <8a3435860747eeaa038ece4ff896c1cdd441c185.1682354275.git.mst@redhat.com>
From: Max Gurtovoy <mgurtovoy@nvidia.com>
In-Reply-To: <8a3435860747eeaa038ece4ff896c1cdd441c185.1682354275.git.mst@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: ZR0P278CA0003.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:16::13) To DM4PR12MB5040.namprd12.prod.outlook.com
 (2603:10b6:5:38b::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR12MB5040:EE_|DM4PR12MB6568:EE_
X-MS-Office365-Filtering-Correlation-Id: 9444f1e2-770d-4ce8-8586-08db45101e3d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	r9jm1rTggJxNAQNDSzOFZi5An8bLFslbfrN5jQCLev3zl1KYvZfk04O6cE/WPwc545/dyLlB919xidLHCplYgHX2gXemDMmTew1vKOq8a+pgyo0vL5Qb7CKfMJ6wK0RNV86AxVpsP7GYuhh2VmlwMoyUMA2wGTxrmxwzR1h8io9rYuSxVDwbLFYo2PwGzTHpKKKq4c4cZHpJL/MZYrNneKrHZNRDPbe9WNGwcTzWu+kRQK3mHMxRq1YkCTNxgXxXe5dN13E2QoNNVMOpp+C/Trt2EP1T55aUyyuPApdlmyYnE++JJhppWY5TfWDRfgw23db8O/15cyZmC1aiFhyH5GgTpWjRv4hifOwXb0UMYGFuvMdbYBKZgdY73umJesUcmy+8HaJLwLmnI1ocGnp4ueKvX4O+n6OvQ3Z781pJFBD0qLp0usn6DxYlyjxf+6TCEUzzYb9L5v69+WUPl0I4gukFSrHGtONErr09q3pNEMd/77eeuRDvyVcUsWVzcGovAjYl7xabM60s83oVvbsVOr1PY9grdy+ZkbgT8MP6WRg3KtkhRtu5U+D160tV2J7yOf4NV1rwzPMtnCEDXerhP7l7T2PJlVfbVPVen+PfRLsTY6wZBkYTaDqE3DQfh2iUlBXrkWT9gkzV/Njgu8k5sJb/pkxoiE7beT4rY2uJSew=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR12MB5040.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(396003)(376002)(346002)(366004)(39860400002)(136003)(451199021)(31696002)(54906003)(86362001)(478600001)(36756003)(107886003)(186003)(53546011)(6486002)(6512007)(6506007)(8936002)(26005)(6666004)(316002)(921005)(41300700001)(4326008)(66946007)(66556008)(66476007)(83380400001)(8676002)(5660300002)(31686004)(7416002)(2906002)(38100700002)(2616005)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UU5HS21FM2lwZktVMlZlWGQ5QWRaZWkrd042RUR2dFIvamtIb01vMjFVRE9O?=
 =?utf-8?B?MGNPd0VWUUtDNXpURFZmUzlheDAxajdTMEFJa29YNzBvN3FDdmxHRlVLbkx6?=
 =?utf-8?B?aXVsMk5JV0l2NGpJMTN1bzhJQ1lEbjcvU29iaGt1VEtrYWY2eU82UTdrTkx0?=
 =?utf-8?B?eXpabnJIOE1YNVN1MUlEaEY3TWkyTXVGS3VPS3ozc1RHSWJ4VWtYREY4YU5y?=
 =?utf-8?B?cjQ1VndJQitNOXM0cDBXTHJsb3BNZW04bk9wSk9DTFBxclE1TjVaZE0remVH?=
 =?utf-8?B?WXFxbHJEQXI1RnNPZml4eXE1SnZKSTVHV21oVFZPMlFPaldjV25raHZVTEVG?=
 =?utf-8?B?MzJuNnQzbXIvUHprWCtKYUNFQ3c5RktZbHVFT0xtRGgvNDV4bmVIMjc3akY1?=
 =?utf-8?B?N1dXazVzN3pVVmU2R1VuOUpnZ3o1b0RwaFM1aU12d29YcGlLNE1Qb21YOWFH?=
 =?utf-8?B?Rzdjc0tjbXR0Ukp6ckVlcmxpeHRnbVZ6OTBtQkpsbU1tWkh6T2sycmJpczRr?=
 =?utf-8?B?dFdaTEhuZVVOUzc4UEExcExwZ1JuZE9yRGkvdm9hcjBqMWJMQjdXSC8wSWVM?=
 =?utf-8?B?Nm5tRmJLK01FWGYraTU3Zkx6V1pQTEFFZEhVLzhZd2xuTThHNUdRV2Z3RDht?=
 =?utf-8?B?dUFHZmVXVms2ZmUyT0xwVVkxUHZwKzZtSWQ4cXFqa1pja1JXWHFsK3ZuaE83?=
 =?utf-8?B?QmpFZEZJNWEzMWNWb1dLSWRtS0hHNksvZzc1Z2dvOU1sMGRNcldDZGZPYU4v?=
 =?utf-8?B?cURqOWk5K1I0OFZoSHlDTWRoNWQzUTFnVkN1MUJkTkpobGZaMFc1RlJ0c0J3?=
 =?utf-8?B?MEdTODZpT2IrbHVUTExKUll1d1JxdU9DQ1YyeUZQQloxRUVmM0V0bE5memJL?=
 =?utf-8?B?bW5wOXJFYkVyV0RCRFNseDg3ZktnSitJRy9QcDdWdUl4ZkZLUnZUWitWUUgr?=
 =?utf-8?B?SXc0bk1udFBIZGpzRkFuRTdtRGFadnozc0I3UFFSbXNLWWZyeUxnQzA1VjlK?=
 =?utf-8?B?cUEyd0VHVVZ3dWh2Zy9FcEhOaHFDaDkyVkhvNVlUNTIxZkI5N2hWWDc5eTZK?=
 =?utf-8?B?NGxKemZBR1kwUnFhbmFER2RYN1VjK280RkZGNXByUVFSOGNxNE5ZdG41dnNx?=
 =?utf-8?B?Wnh3Y3lpYmtFUWIvZjZBdDc0dGo0UTZxMWVoRUdaWTJpUEN4bml2TmM3anNZ?=
 =?utf-8?B?LytKNmRxQnBNZ0xoNEgxajMzM3lYUmcyeGVTT0JwMDFDbWxpS24vQ1J5TWFr?=
 =?utf-8?B?NUtrR2d2dXNDMitMUTNFalRibnlKU2hlNjdlRVBZeVAwZ3ZRdlh3eDcyTGs3?=
 =?utf-8?B?dzdSaGJQTzBRbFBBa2xwNGErNGRxTStWQjFhUzhNOXM0NXVNSVVrSUlSdWV4?=
 =?utf-8?B?QXBlazdndFZtcGVnN2s4VW9DNmN6aUpuRDAzb0gxQmtRN1ZTN0U4bE1yY3o1?=
 =?utf-8?B?S3c1dlRTaEhuNnBabUhrM0w4d2R1ZmVDeW9XWDBoYmtUZUYxN211SGtMTTBp?=
 =?utf-8?B?MlY2RnVsdHF6OHNCbnR1WmVEVGoxbURTZlBnVldkeGtKNnowdWVzWk9VY0Vl?=
 =?utf-8?B?dWJoN1U4V2luUm1WSUxJeFN5dlVrSnhhRU5KdXdlTEQrZ05SdTRpdjIraGVX?=
 =?utf-8?B?WXpVRUYzZEF4RDBmV2R5K0VUUXNTZHhiZ25EYVhNaFJEUzY0WHFITlkzTTNK?=
 =?utf-8?B?Y0NrRlI0Mm9OSlRzRlptTm1RM1J6NjYvOTdTRGtPR0o0aXpSUStxRndSQzMy?=
 =?utf-8?B?WEZKUU05UmZpYytLWjQvYzl1cGIvV3A3YjZTRjJDOW5aU0xTMDVDZjhvckM4?=
 =?utf-8?B?M0x2YzJNcXN2MHp4ZjhyRis1UHdLZHk1dy91ZmdGejFGdjdWbWxJQTk5SmtN?=
 =?utf-8?B?bUNzb1dyQkhtTUh2WlpndWJmSFp3Y2ZrbE9YVi9lMGRWZEh5Zk1TWTBDTjdH?=
 =?utf-8?B?dGJFbHRMSEcrZnZTWjdCTTZ6cXYyc21XRUpudmlQWVN0bjA2akZvaDJVSFIr?=
 =?utf-8?B?WlMvVUwwdlJSNzRyTThVRHZrTUYzbXpMOVFvaDBOc1Z0QVNrWVVuUUt0TkF1?=
 =?utf-8?B?UDBnSWtqbktPSGRmNXVXREhYckFVN0ZBcGtZNUNQRTl2MzE0c2VocXpiUEMv?=
 =?utf-8?B?Y2FJVkZFTGdRSWFZTWUvYTd4OVJsRmtZMEJJZHpZZkJ3NUlKblpERWlFMzNi?=
 =?utf-8?B?bXc9PQ==?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9444f1e2-770d-4ce8-8586-08db45101e3d
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB5040.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Apr 2023 22:06:13.4970
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: whTU6Xl/crl2g7M62DRDDzc3lpSAwAZBPl+0QriIYkTIzfazlnPQyXyp+IpcGNyJYCFg3tEl8QICgbkzOmuXQg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB6568
Subject: [virtio-comment] Re: [PATCH v12 05/10] pci: add admin vq registers to virtio over pci



On 24/04/2023 19:44, Michael S. Tsirkin wrote:
> Add new registers to the PCI common configuration structure.
> 
> These registers will be used for querying the indices of the admin
> virtqueues of the owner device. To configure, reset or enable the admin
> virtqueues, the driver should follow existing queue configuration/setup
> sequence.
> 
> Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
> 
> ---
> dropped Max's S.O.B
> make queue_num not 0 based
> 
> squash! pci: add admin vq registers to virtio over pci
> 
> since v11:
> 	document that admin vqs are not counted with regular vqs
> Reviewed-by: Parav Pandit <parav@nvidia.com>
> Reviewed-by: Zhu Lingshan <lingshan.zhu@intel.com>
> ---
>   content.tex | 35 +++++++++++++++++++++++++++++++++++
>   1 file changed, 35 insertions(+)
> 
> diff --git a/content.tex b/content.tex
> index 2eb15fa..bcbc06d 100644
> --- a/content.tex
> +++ b/content.tex
> @@ -948,6 +948,10 @@ \subsubsection{Common configuration structure layout}\label{sec:Virtio Transport
>           le64 queue_device;              /* read-write */
>           le16 queue_notify_data;         /* read-only for driver */
>           le16 queue_reset;               /* read-write */
> +
> +        /* About the administration virtqueue. */
> +        le16 admin_queue_index;         /* read-only for driver */
> +        le16 admin_queue_num;         /* read-only for driver */
>   };
>   \end{lstlisting}
>   
> @@ -974,6 +978,7 @@ \subsubsection{Common configuration structure layout}\label{sec:Virtio Transport
>   
>   \item[\field{num_queues}]
>           The device specifies the maximum number of virtqueues supported here.
> +        This excludes administration virtqueues if any are supported.
>   
>   \item[\field{device_status}]
>           The driver writes the device status here (see \ref{sec:Basic Facilities of a Virtio Device / Device Status Field}). Writing 0 into this
> @@ -1033,6 +1038,19 @@ \subsubsection{Common configuration structure layout}\label{sec:Virtio Transport
>           This field exists only if VIRTIO_F_RING_RESET has been
>           negotiated. (see \ref{sec:Basic Facilities of a Virtio Device / Virtqueues / Virtqueue Reset}).
>   
> +\item[\field{admin_queue_index}]
> +        The device uses this to report the index of the first administration virtqueue.
> +        This field is valid only if VIRTIO_F_ADMIN_VQ has been negotiated.
> +\item[\field{admin_queue_num}]
> +	The device uses this to report the number of the
> +	supported administration virtqueues.
> +	Virtqueues with index
> +	between \field{admin_queue_index} and (\field{admin_queue_index} +
> +	\field{admin_queue_num} - 1) inclusive serve as administration
> +	virtqueues.
> +	The value 0 indicates no supported administration virtqueues.
> +	This field is valid only if VIRTIO_F_ADMIN_VQ has been
> +	negotiated.
>   \end{description}
>   
>   \devicenormative{\paragraph}{Common configuration structure layout}{Virtio Transport Options / Virtio Over PCI Bus / PCI Device Layout / Common configuration structure layout}
> @@ -1119,6 +1137,14 @@ \subsubsection{Common configuration structure layout}\label{sec:Virtio Transport
>   were used before the queue reset.
>   (see \ref{sec:Basic Facilities of a Virtio Device / Virtqueues / Virtqueue Reset}).
>   
> +If VIRTIO_F_ADMIN_VQ has been negotiated, and if the driver
> +configures any administration virtqueues, the driver MUST
> +configure the administration virtqueues using the index
> +in the range \field{admin_queue_index} to
> +\field{admin_queue_index} + \field{admin_queue_num} - 1 inclusive.
> +The driver MAY configure less administration virtqueues than
> +supported by the device.

we need to say something about other virtq's indexes.
For example, if aq index = 0 then for the vblk device the request queues 
would start from index = 1.

can we address this ?

> +
>   \subsubsection{Notification structure layout}\label{sec:Virtio Transport Options / Virtio Over PCI Bus / PCI Device Layout / Notification capability}
>   
>   The notification location is found using the VIRTIO_PCI_CAP_NOTIFY_CFG
> @@ -7686,6 +7712,15 @@ \chapter{Reserved Feature Bits}\label{sec:Reserved Feature Bits}
>   
>     \item[VIRTIO_F_ADMIN_VQ(41)] This feature indicates that the device exposes one or more
>     administration virtqueues.
> +  At the moment this feature is only supported for devices using
> +  \ref{sec:Virtio Transport Options / Virtio Over PCI
> +	  Bus}~\nameref{sec:Virtio Transport Options / Virtio Over PCI Bus}
> +	  as the transport and is reserved for future use for
> +	  devices using other transports (see
> +	  \ref{drivernormative:Basic Facilities of a Virtio Device / Feature Bits}
> +	and
> +	\ref{devicenormative:Basic Facilities of a Virtio Device / Feature Bits} for
> +	handling features reserved for future use.
>   
>   \end{description}
>   

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

