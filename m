Return-Path: <virtio-comment-return-5610-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9CBF3C7618E
	for <virtio-comment@archiver.kernel.org>; Mon, 24 Apr 2023 21:29:18 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id B8DF62AD77
	for <virtio-comment@archiver.kernel.org>; Mon, 24 Apr 2023 21:29:17 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 8E81A9863E1
	for <virtio-comment@archiver.kernel.org>; Mon, 24 Apr 2023 21:29:17 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 746E9983F7A; Mon, 24 Apr 2023 21:29:17 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 609319863A5;
	Mon, 24 Apr 2023 21:29:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LuyWxRwrCXT55vd1nnY0LZ3+k+ePfPwXrrDlA4+LCAyOh340+hTTn8nzXQWwu9n7VCCNykYOEr0dIv8/eezlTBArQe5u4CT9qCdXQ9dT1av5XZXJTe79mGUlrraGcDebsTEPUW/CVy+dIU8Un1cy8dI5FmOgyQ350kLOkJXu9T5VYN/K+qOjbrrEmQOjFPUDZdyIHsbmTrvziDaUy2xoB0DN5HSiJHR25IXhH+sJAyVn96Q6A92HbfYbiOxehcMvEo/4S1nLx2c5WfWQx440Hef4AB9sTJZk1HHwzq/ingrYSN7hq7OU7sWaqL8tCQRjLHwpA13+hcXD1W2IfZ8ybQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3zU+UBPf/Mr7PZDB5KxvZK1SV++GoIxt5y5QM6mqxkE=;
 b=XjlscSfppAg6+5BnW58Nw7QCHljxqjMjgQfK/G0mhumF8YbAaiPOTiz1kpm0ml1Jg8V+xylAu0XErUacYf7DlcfcYrKkkKJrU4iN+rU2GCR8DIkLYDemBpsQqvS8d5oJjc6PVSvlBn60Y0HXSU2x1Z5h7J0Tf8pAJ938T1CuRf10Sy5VHZJOvSLGZh7ZBgVrIsETaB6Z214gKQ01BD3PEn55Q4eJj7o+z6GZvbRGia3fMQ+uPpZuyrAmdFNKgYn4mlhcBejQ5pc8DyLn3pNyqUbMq3q09kGEZNM6mnZJiw5YTtdfG2Xf8/PRU5QHSA3e59nVfCVZ7o1So83sOaVu5A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Message-ID: <d9b0454c-747a-4ac9-b00d-005e066fa3e4@nvidia.com>
Date: Tue, 25 Apr 2023 00:29:02 +0300
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
 <79c27bca6f72e4ea5d1d0e3a6b1a54369b03fb30.1682354275.git.mst@redhat.com>
From: Max Gurtovoy <mgurtovoy@nvidia.com>
In-Reply-To: <79c27bca6f72e4ea5d1d0e3a6b1a54369b03fb30.1682354275.git.mst@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO2P265CA0264.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:8a::36) To DM4PR12MB5040.namprd12.prod.outlook.com
 (2603:10b6:5:38b::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR12MB5040:EE_|PH7PR12MB7017:EE_
X-MS-Office365-Filtering-Correlation-Id: 6d36639c-8a27-4b13-ab98-08db450af26f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	x3Cu6HYEXhgDGwlGp+QV78PRX5NM6Vqft44EDoppMczxc83lfDl+kxFcdRQN4y9t7Iiuc9eZntpSm9XMxGVG69V1icv7TP1qblQ85EpBCjZV+Syg1UerGdBABkJhhZrZ3AiS2ybvD78JcfJ3BxY0F/qw8kwcbd+L4bCce4tL4zd8NVM46JoX3AqjoW5msPGv8uX38Rn910cm/ZWO+ftk41TAyb97gmq4g/nyYWit0AM+LwnxYp1/oSuxLxaxrp+GCD1XHiLT/SE0XWLJlFnS9IDOh9g3ft8oYZ0OQQjS5dSWRNLo5XRhMPZ0gRvaa/PjizbQ2KtZD01VLtXVkNSRTn3lNScmxGGLTGsbk55Wsdi1OguQ/OMg6q/diYpN/fys/c/mG8Aja0QQH4vy9FspgzsGRQ4hdV4WScnBS+EYzDq1R84Xr3M2oZV/jbRpa2w3eK+UUV5tJyVDOgBkL0v9R3xezN4L8cLTxfZ9hnEvicxfJWPdxQF1VDHdyM+Lb7GcwUlCD3MnZaJk9eqg+0KpaS6IgcjSv5lbUrmAm2O0H7dYWunPGXN0SX/7e5V8jZB1sAVFp3PJC0a5/UOvi+pMZqgMncjpF4dS0O7x/vy9DF5h0A2eASmr5IKvJj4fjcGSGfrFglrHwWkYOLlwbhTFoCMVmyu0FQQLHiEsxTD0nbGtJE4RX5uGNppjEZ1Nk/yowQpKEtzfE5cEENnShkRxwdUcQnJuXLxfHVSmnNiSQ8rkS9iYY7lpIQRPQn1hBZ/2
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR12MB5040.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(39860400002)(396003)(366004)(136003)(376002)(346002)(451199021)(107886003)(53546011)(6506007)(26005)(6512007)(2616005)(36756003)(83380400001)(186003)(921005)(38100700002)(66946007)(478600001)(31696002)(86362001)(66556008)(66476007)(31686004)(8676002)(8936002)(54906003)(7416002)(5660300002)(6486002)(66899021)(41300700001)(2906002)(4326008)(6666004)(316002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MVFtb3MyN1craWYvU0dQNFNqZjRQd0lyQWRiT0VqbkFnSGkxbFZDWlROYTZi?=
 =?utf-8?B?VkNYS0JROXdKRlA3U0ltZVQ0TWV1K3U3eUsyeWtjZGxCY2VIZ2hGWHZzWHNK?=
 =?utf-8?B?Vys4cFdmTVl1ZU5ycjRJZHlrL1AzOW9Zek9NL2I3UHJrSW04WnROL3NtL2gw?=
 =?utf-8?B?eFNCM3luTC9NR3ViTGEzV2UvZFRZSjM5c3ZDSjJYd0hPVU9nc29XSFMzSEZO?=
 =?utf-8?B?YjE0c0o0NDBMVXJQOHpIQ3ZPZUNtOFNKcW5yN1ZhQ3NaZ2lQUFplaGhaQ0JP?=
 =?utf-8?B?bTk1ZERiUE10RURIcVdOMzFVRjdxYkVtVUhVQUNoYVVxV3dpczlnMHI3eHhM?=
 =?utf-8?B?WCs5Wk1nWmJmemtoZTBVK2RNeitBMkhiYldIc1JXUUs2bjdMRkJVd2xTVDc3?=
 =?utf-8?B?Wno5bzZodkxzWHFqUGVBbnRpbnhOL3lsUjB3SFk3SWFsWFgzVEg2dDlMOGFt?=
 =?utf-8?B?b0dtVVNvRGxteHdkRVRMR2NnczNLR0R1USttcmtUMlAvd1R2dHg1WEUvOFNk?=
 =?utf-8?B?U29hQndOK0YwMEZSRW4rcU1sUVVVbFd1QVBLdlFzZUlLQjdUS2JJSHAzcVVF?=
 =?utf-8?B?aHlsdEZLZWVUSEdyMEx1aFRJbXcvWDRkbU14c3Vva0ZiTEd5S2kxWTU1VzQx?=
 =?utf-8?B?eCtqYUxWdzdRem85LzNhUUdNZlhGNVQxZStlaUpKbEc0cHVqbFJXU00rQUlv?=
 =?utf-8?B?OURqbWNPOXhCWDMvMjM2elN6M0VaTFNDbEhUbytZbm5GZ2F0cnFCN28vYTI3?=
 =?utf-8?B?QTZ5Y3dmcVd1aGpjWVk5empjVGRWSnFhSWIzZm1iOGJqWmRQWmdZWVZFMWVM?=
 =?utf-8?B?Yjd0RHF3TStubDdxMDc5c2dnanM5amFiSkxxV1c2OU4zc0JEM2N6elZqTDh6?=
 =?utf-8?B?R00wZUNSa0psYlF4TFpJRG9iUlNsdFViMXg5TERTaFFuNHRtTnRqYzVEQW9z?=
 =?utf-8?B?VUpPV0x5OTBKK1FwYVNnRDNFZlZXRXM4ckVmZWR4Z280RmRKL1FLNXJhQnU1?=
 =?utf-8?B?bDJqSFJwWG81eTVnQkJLZVJVcWJKQVpORE1QeE03b2NvQ3N5aEorUUdsRGgw?=
 =?utf-8?B?U1NqYTNRSGZBRTIwSXQzOWhaT1JQd1BjTHpVLzJsdkttdEJNTXppRTQ5dFNE?=
 =?utf-8?B?TVB5Y0J2TU1rOTFrSXNRdlNDL2dyYkN1UTlESGs2WGRaYnBGTWpGWStKQnhp?=
 =?utf-8?B?UmVYZFBFUVg2ZDZQVS81WFJEaFJycUVQRk9PV1BSbFoyUHJ1RlRSdTdmVDRr?=
 =?utf-8?B?U3grNFhiKzRQTjdmcTVKMzV1aURiZFZrUTRFNlB5MUprNS8rb1c3blRXL0U2?=
 =?utf-8?B?WFo2MXZkRXB1NDJEaUZzQ2Nwc0hSWXR5YUx1aTJGSzRWY09aNjh4K21nK2NW?=
 =?utf-8?B?VVljUi9abUxlaGVvaDNGUVhaa0RMU1VrcWdoNEVPTG9tbE9YemY5R2Z4UzB2?=
 =?utf-8?B?aWlQUnVIYWcvNHJKZGFJelZ1czI3cTFKeDg0UnJxYXA0SFNEWHJXcWo2NFZ2?=
 =?utf-8?B?L1lpbExvVEhIV0F1WWtJSFVsR3VUVnZnZHV0SHlvZlhMMUtOTUo2bDZhc0lK?=
 =?utf-8?B?ZCtkKzh1anlucmtqbzkzYitUTXZ3ZHFNY2djS2FBZnY1VWgwRDE3WXg0cnF6?=
 =?utf-8?B?dE1oZTlqS1NXdVRuV1dKcUU1VWdlbXprQU1uR0JvZWJPc1FqN1V0dVJVK2hj?=
 =?utf-8?B?dmtTZTFVSVhjTzM0bWN1aGNIWHMyQXFOS084a3ZYL0NPSTMyK1dFQStSNjVM?=
 =?utf-8?B?cjh4MGZFb1Q1M1VlYmN3bUtyTm1PVVA5QjRvbExxM1JpaDE3OWRQc08zczZ3?=
 =?utf-8?B?aUtlN1BYQWZFbkF3TSt4OHdlYkxuSXRpOTQzSWNFM0d6Q0VsYUJLSFFmbndD?=
 =?utf-8?B?MTRJZ0NqWXNkQTFRQUgwUThGZVRkMWdaSjF2MXBudk5hSzc3eEU5MTZlZDZq?=
 =?utf-8?B?WmtyWGZnY3hiMDc0NG5QOUZpcFd3eENIcTB5ak5lR1VzZ1UzRzd4Z3pMZytl?=
 =?utf-8?B?R1RzbzM2YWVBT2JVejJDbnc0SGF5dmRFT3JqT1ZpbzNrOER0RHNqMkNTcUJN?=
 =?utf-8?B?blhsMU13VjhmOG5CV0haZzI2YlF6SVNIa3NSQTVoNnNzV1R3cnYxZHUxRGNR?=
 =?utf-8?B?MjlBd3g3c0ttK2plQkdaQmtka0RQK2NlN3J6ZG1CSzd2OEMxNG0yOHIxVzZu?=
 =?utf-8?B?c2c9PQ==?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6d36639c-8a27-4b13-ab98-08db450af26f
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB5040.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Apr 2023 21:29:12.5647
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bcGx4OxE4XA+djLfkHiuhvB688vj4u1epjN9LXNG3BLDgGvfkl9cKIbJlRJzmRS3iEKoNjn+hg71D0rdgTz78g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB7017
Subject: [virtio-comment] Re: [PATCH v12 03/10] admin: introduce group administration commands



On 24/04/2023 19:44, Michael S. Tsirkin wrote:
> This introduces a general structure for group administration commands,
> used to control device groups through their owner.
> 
> Following patches will introduce specific commands and an interface for
> submitting these commands to the owner.
> 
> Note that the commands are focused on controlling device groups:
> this is why group related fields are in the generic part of
> the structure.
> Without this the admin vq would become a "whatever" vq which does not do
> anything specific at all, just a general transport like thing.
> I feel going this way opens the design space to the point where
> we no longer know what belongs in e.g. config space
> what in the control q and what in the admin q.
> As it is, whatever deals with groups is in the admin q; other
> things not in the admin q.
> 
> There are specific exceptions such as query but that's an exception that
> proves the rule ;)
> 
> Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
> Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
> Reviewed-by: Zhu Lingshan <lingshan.zhu@intel.com>
> ---
> 
> changes since v11:
> 	acks by Stefan and Lingshan
> 
> changes since v10:
> 	explain the role of status vs status_qualifier, addresses
> 		multiple comments
> 	add more status values and appropriate qualifiers,
> 		as suggested by Parav
> 	clarify reserved command opcodes as suggested by Stefan
> 	better formatting for ranges, comment by Jiri
> 	make sure command-specific-data is a multiple of qword,
> 	so things are aligned, suggested by Jiri
> 	add Q_OK qualifier for success
> ---
>   admin.tex        | 121 +++++++++++++++++++++++++++++++++++++++++++++++
>   introduction.tex |   3 ++
>   2 files changed, 124 insertions(+)
> 
> diff --git a/admin.tex b/admin.tex
> index 05d506a..d6042e4 100644
> --- a/admin.tex
> +++ b/admin.tex
> @@ -60,4 +60,125 @@ \section{Device groups}\label{sec:Basic Facilities of a Virtio Device / Device g
>   PCI transport (see \ref{sec:Virtio Transport Options / Virtio Over PCI Bus}).
>   \end{description}
>   
> +\subsection{Group administration commands}\label{sec:Basic Facilities of a Virtio Device / Device groups / Group administration commands}
>   
> +The driver sends group administration commands to the owner device of
> +a group to control member devices of the group.
> +This mechanism can
> +be used, for example, to configure a member device before it is
> +initialized by its driver.
> +\footnote{The term "administration" is intended to be interpreted
> +widely to include any kind of control. See specific commands
> +for detail.}
> +
> +All the group administration commands are of the following form:
> +
> +\begin{lstlisting}
> +struct virtio_admin_cmd {
> +        /* Device-readable part */
> +        le16 opcode;
> +        /*
> +         * 1       - SR-IOV
> +         * 2-65535 - reserved
> +         */
> +        le16 group_type;
> +        /* unused, reserved for future extensions */
> +        u8 reserved1[12];
> +        le64 group_member_id;
> +        le64 command_specific_data[];
> +
> +        /* Device-writable part */
> +        le16 status;
> +        le16 status_qualifier;
> +        /* unused, reserved for future extensions */
> +        u8 reserved2[4];
> +        u8 command_specific_result[];
> +};
> +\end{lstlisting}
> +
> +For all commands, \field{opcode}, \field{group_type} and if
> +necessary \field{group_member_id} and \field{command_specific_data} are
> +set by the driver, and the owner device sets \field{status} and if
> +needed \field{status_qualifier} and
> +\field{command_specific_result}.
> +
> +Generally, any unused device-readable fields are set to zero by the driver
> +and ignored by the device.  Any unused device-writeable fields are set to zero
> +by the device and ignored by the driver.
> +
> +\field{opcode} specifies the command. The valid
> +values for \field{opcode} can be found in the following table:
> +
> +\begin{tabular}{|l|l|}
> +\hline
> +opcode & Name & Command Description \\
> +\hline \hline
> +0x0000 - 0x7FFF & - & Commands using \field{struct virtio_admin_cmd}    \\
> +\hline
> +0x8000 - 0xFFFF & - & Reserved for future commands (possibly using a different structure)    \\
> +\hline
> +\end{tabular}
> +
> +The \field{group_type} specifies the group type identifier.
> +The \field{group_member_id} specifies the member identifier within the group.
> +See section \ref{sec:Introduction / Terminology / Device group}
> +for the definition of the group type identifier and group member
> +identifier.
> +
> +The \field{status} describes the command result and possibly
> +failure reason at an abstract level, this is appropriate for
> +forwarding to applications. The \field{status_qualifier} describes
> +failures at a low virtio specific level, as appropriate for debugging.
> +The following table describes possible \field{status} values;
> +to simplify common implementations, they are intentionally
> +matching common \hyperref[intro:errno]{Linux error names and numbers}:
> +
> +\begin{tabular}{|l|l|l|}
> +\hline
> +Status (decimal) & Name & Description \\
> +\hline \hline
> +00   & VIRTIO_ADMIN_STATUS_OK    & successful completion  \\
> +\hline
> +11   & VIRTIO_ADMIN_STATUS_EAGAIN    & try again \\
> +\hline
> +12   & VIRTIO_ADMIN_STATUS_ENOMEM    & insufficient resources \\
> +\hline
> +22   & VIRTIO_ADMIN_STATUS_EINVAL    & invalid command \\
> +\hline
> +other   & -    & group administration command error  \\
> +\hline
> +\end{tabular}
> +
> +When \field{status} is VIRTIO_ADMIN_STATUS_OK, \field{status_qualifier}
> +is reserved and set to zero by the device.
> +

actually it is:

When \field{status} is VIRTIO_ADMIN_STATUS_OK, \field{status_qualifier}
can be ignored by driver and set to VIRTIO_ADMIN_STATUS_Q_OK by the device.

Can be moved after the status_qualifier values paragraph.


> +The following table describes possible \field{status_qualifier} values:
> +\begin{tabular}{|l|l|l|}
> +\hline
> +Status & Name & Description \\
> +\hline \hline
> +0x00   & VIRTIO_ADMIN_STATUS_Q_OK               & used with VIRTIO_ADMIN_STATUS_OK  \\
> +\hline
> +0x01   & VIRTIO_ADMIN_STATUS_Q_INVALID_COMMAND  & command error: no additional information  \\
> +\hline
> +0x02   & VIRTIO_ADMIN_STATUS_Q_INVALID_OPCODE   & unsupported or invalid \field{opcode}  \\
> +\hline
> +0x03   & VIRTIO_ADMIN_STATUS_Q_INVALID_FIELD    & unsupported or invalid field within \field{command_specific_data}  \\
> +\hline
> +0x04   & VIRTIO_ADMIN_STATUS_Q_INVALID_GROUP    & unsupported or invalid \field{group_type} \\
> +\hline
> +0x05   & VIRTIO_ADMIN_STATUS_Q_INVALID_MEMBER   & unsupported or invalid \field{group_member_id} \\
> +\hline
> +0x06   & VIRTIO_ADMIN_STATUS_Q_NORESOURCE       & out of internal resources: ok to retry \\
> +\hline
> +0x07   & VIRTIO_ADMIN_STATUS_Q_TRYAGAIN         & command blocks for too long: should retry \\
> +\hline
> +0x08-0xFFFF   & -    & reserved for future use \\
> +\hline
> +\end{tabular}

should we mention which status_qualifier can match to which status (as 
we did for STATUS_OK) ?

> +
> +Each command uses a different \field{command_specific_data} and
> +\field{command_specific_result} structures and the length of
> +\field{command_specific_data} and \field{command_specific_result}
> +depends on these structures and is described separately or is
> +implicit in the structure description.
> diff --git a/introduction.tex b/introduction.tex
> index 287c5fc..b7155bf 100644
> --- a/introduction.tex
> +++ b/introduction.tex
> @@ -68,6 +68,9 @@ \section{Normative References}\label{sec:Normative References}
>   	\phantomsection\label{intro:FUSE}\textbf{[FUSE]} &
>   	Linux FUSE interface,
>   	\newline\url{https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/include/uapi/linux/fuse.h}\\
> +	\phantomsection\label{intro:errno}\textbf{[errno]} &
> +	Linux error names and numbers,
> +	\newline\url{https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/include/uapi/asm-generic/errno-base.h}\\
>           \phantomsection\label{intro:eMMC}\textbf{[eMMC]} &
>           eMMC Electrical Standard (5.1), JESD84-B51,
>           \newline\url{http://www.jedec.org/sites/default/files/docs/JESD84-B51.pdf}\\

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

