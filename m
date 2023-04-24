Return-Path: <virtio-comment-return-5609-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D758FC77B61
	for <virtio-comment@archiver.kernel.org>; Mon, 24 Apr 2023 21:02:43 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 19BBE23D53
	for <virtio-comment@archiver.kernel.org>; Mon, 24 Apr 2023 21:02:43 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 0518398643D
	for <virtio-comment@archiver.kernel.org>; Mon, 24 Apr 2023 21:02:43 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id DF2DC983F7A; Mon, 24 Apr 2023 21:02:42 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id CAED29863A5;
	Mon, 24 Apr 2023 21:02:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GyXbe9ECLv4CaxGLroC+Bqe0jynNCqkHDYxvCHs6GKgiSRxpsMvOD3hiogcVhtIuyW5Ot3GxjbGKHn4d2lufaYNLUGIlm7XVNSBQk41KSh3t7j3pAeRQSdN+qV9eAY8bWBbgOYF03pUr7pshFjEHi2YzZy+YNApQ2B3N1Bwv1LHluRFRG5tmWXuTiq3qgbDP/quyDTnP3nVwll1suNAGffO+upPIszP/wU4/vi19lv+DnYUo5FCM6Nmn+LN+XP8CLG3xwLWyLltfJt8pzwTN/NTcJwUtQU4qp+AvpSGZvFYyUaN6rJJYWWehKTDY9uTrvlHqskeIQAmFAuDIXyAK7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/bYc9ySsMfwlgaMj+fJRzvfH/xHXv3zZaxS1xBpDcjE=;
 b=GBynieWBO9wVlwbUT11SoKM8prtsd6eZBdVuhSBOsH6GOirThZJpMhBf6eUUt0r/FcUpd1shNA7NGXymq8u7I/zPMVnGwnG6ny3Dy7Xj7Z0p0wkcGolYGVMA6jdjDPtqsbdQz5TlTEWc/sgJsXFHJJt5Y20IXWfoLa2VppVF941yNKb01lSD7i+eyTOMNZhCETglT5RMoXGyTBNc8CWnXrrRegY5/wsnomtKKt8XaWprQ7jNT7ahgug3g06J+dZrPioNW4oQOjmBKq8clveJiyxyI23QpNmEbnnI6HzPaR2SXjlT6dKLdKSuCkIgu3ut4e8hpsn92VcjDJ0LavQuIA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Message-ID: <fd84e3f7-9b0f-6c55-ef95-4e631ba36d98@nvidia.com>
Date: Tue, 25 Apr 2023 00:02:25 +0300
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
 <1c8fd21fc009897b5d338976888c25fa81ac896f.1682354275.git.mst@redhat.com>
From: Max Gurtovoy <mgurtovoy@nvidia.com>
In-Reply-To: <1c8fd21fc009897b5d338976888c25fa81ac896f.1682354275.git.mst@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO4P123CA0053.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:152::22) To DM4PR12MB5040.namprd12.prod.outlook.com
 (2603:10b6:5:38b::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR12MB5040:EE_|SN7PR12MB7022:EE_
X-MS-Office365-Filtering-Correlation-Id: 6e73a95b-469d-440d-cab9-08db45073d45
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	paQnbIcS+GW06z5PbcZEtyjImsKkW+75MBy0+6ytMvyxYu0Mo8tUO0Leq+iE1/CnDRq23Te1R6MXQ22/S76PD3rd7kKFB2mM+36N9VunsRbdvi5C1iVSWSXZmN0APXYkC+Ifm6JRe3Jpi2KzOWCaAstt6YawMDkttwhOt3990q5v004cdKog6JAdQCWrhH8M5rRlMBbxiVVOUYClEOzFSqE4m01b08eu8kyd3IgcT/hzw3lTERk1kz+XPVPuc9uyiA3UCty6zzfmn0dwRYlWR6GjLqeGLIGkKWZc0MGdME7OHxwll4QKCUQap5WFkBvCf9ZPPFaHYxDXIsF9Y/UqYrepBJvTqVNI+3l/pePjqSYmRZvORTtEA0NG5LITM2FEHHzRY/iZLORy6tZM/gh4l+mWXIVq4E3FE3wEkaGTzZflP/PTNipZ7qNPTVS/9R1hruvDYQY2DE5p/vA9mwM9aJKI08SQvRf43+NI+y+ib89+fnwBNgaQVX9XjgYmINZgDXpI5jnLVaqoJtL/sb7ULaD8yXhdKlj+6icRLrtEKTTa+Bf/JUcUnoLA6Em3AObwKaA//c55LuouGFCQ8IDZmyIAUQ7IWph+7GYoB0JfYYb79OW6cgWBLu6HCKi+wdIlcovXSCl419/v3X8Mz/ybWy0CQTSNQzC6oSZccWaRygw=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR12MB5040.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(39860400002)(396003)(366004)(136003)(376002)(346002)(451199021)(107886003)(53546011)(6506007)(26005)(6512007)(2616005)(36756003)(83380400001)(186003)(921005)(38100700002)(66946007)(478600001)(31696002)(86362001)(66556008)(66476007)(31686004)(8676002)(8936002)(54906003)(7416002)(5660300002)(6486002)(41300700001)(2906002)(4326008)(6666004)(316002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NktWYUZmVC9GTHNpNGdDUUVIWUYzd2J5WXlSOEphZzVJSkNaS1JBc3JuNWEz?=
 =?utf-8?B?azJJVm9KQmtlOTgrV0FPS0hjNXAydVpLeVlLU1BVNW1ra2FFU0wvOTdkdXZq?=
 =?utf-8?B?VEU3WXhvWE5iS3V2YVBwZlhac1pTbVAxeUE2bDNPQytDcnR2QTFqcy9jYVVm?=
 =?utf-8?B?Q0gwUDdXdGdidnFBTG5POCthYzN4UDlkbXh0cGdzYzlnS05BbG5LVk1iVEV0?=
 =?utf-8?B?aHZlOVpsb0o3bUlwZ0k4bjgzckNUU21IdExzaTZhbmJVUXQxTzFLYmQrMktW?=
 =?utf-8?B?WjBDbDdSWkMyVmphcE5MZ1RuSDhpa3JQSkJUSW9zOU9rYWcrajNUZHRCMXNv?=
 =?utf-8?B?UHRWSmhUeno3V3c0RlNWU2xZQ1dnVm93Wkd3OURpSnZPMU55YnBzbUU0cGZY?=
 =?utf-8?B?M0laaTNQZFpsZUxuaGdZMit0clpsdW5kekdlWUlDR1lMOTg2S2FIK2tMZjRM?=
 =?utf-8?B?MkxsaFYySEhMR0xMaHVKSzVhSFN5QVYwSWlWd3BiZytxcW14di9oRldIVWp3?=
 =?utf-8?B?ZDNGeFZwQXEraGxkUTZ6Tmx2Z2l5WE9Bc0I0Qm1uMHc2cXJHdjlPd28wbUlV?=
 =?utf-8?B?V1FuaU82WTMxUWxJTE1tdkVTaXRORDJqNjRMUEduWjNVWEdCV0Z5emp0YVhP?=
 =?utf-8?B?MUU2NzZFeEdqL2pzbnRQK0J4RWQ3bWxNcTNlaDk4Q3lCYjFRSEVEWVFuVGRF?=
 =?utf-8?B?MFl4UlhwTFNsZDgvbzc0ZFJIaXhkUjF4UUVFb0JkUHVpYjEyTlEzRlBjSys4?=
 =?utf-8?B?V3RWaG5EdldhNEp6M1l6dGhUemtvMC9PSGhUK0IxTVFiMHpFMlY0QVpaeTZX?=
 =?utf-8?B?SnRWdlVkdVpwTDlpZTBwUTh5ZkVvdEF0QUU3YWY4bUptbGxuVFlzMGlzdG5I?=
 =?utf-8?B?Z1pEVFVyNHdVL2s0bng0WW05SUNDRUNvU1lwR0djTHljcEVmWTJhTDBzTzRV?=
 =?utf-8?B?Q1dnZUNaSWZyMkt2NmRLMHpFOG1uMzc5M1NFOW0yL0wxcEtiRjZJZFUvRTJL?=
 =?utf-8?B?SEUrdzFpY2lHWFE0SThMSTBOSmdqVTl5bjlyMjV1ZGZmS1U2eVVPUGh2ZFNX?=
 =?utf-8?B?dlhpelRpYmZseEM5WFNFRWU2TzNFczZCSFpzVml1dWMxN2RCdzE0ZzB1UHY3?=
 =?utf-8?B?ZS9XbXIxOFRmbFF1d29CbmcxNy81WFViOTZNOHR3aUlZSzRWK1huSkUySWpF?=
 =?utf-8?B?QndkYlV4dlRpU3N1ai9qaE9nYVkvUDg1RXRjcmEybFZndlhoT3hGSjE3M3Bq?=
 =?utf-8?B?QnNVWi9tbkozamJHUVFmWllWeEFLUi96U011VEtCcDVxUDhJVWNZY0dYOFdR?=
 =?utf-8?B?MUdhZTR2bjBHUFZPSHB3ZFU2KzRDZWYwSFlrWEtVMnpFNGJvUXlEL00rNlcv?=
 =?utf-8?B?ZmQ2SXBzT3FQNGg1T1RNdm90cU5KZS82KzlnbyswRlRKMWM5K1NjRm5jRitX?=
 =?utf-8?B?Z21ZNjFOSTZucmNEYW5kREk5cTFmLzRFa2JiUzZQLzRISUdOTXdHMWFGc0ds?=
 =?utf-8?B?cHRlK2dDUlZGWUo4KzBtTnJvM3gycnlkdHpYdyt2dEtrdlhoNy8xU2ZGSmNa?=
 =?utf-8?B?dmNSdTg5Z2ZOZVJHaHFNYmpYQmFxWmlzd1oyQ2J2blBabC9yZHNhUzVoZFBZ?=
 =?utf-8?B?aUx3Mk9JQXdkL1BrSE5lZWxDWS93TmpEZ1JZeDltNnRaRzJVRGNiUUhZUGtu?=
 =?utf-8?B?eVhvdmd5cWp5Tk1wZ0VXQml0R01tWGVmbXJEbHBleUwzaFBPZXJtSEtLd2VL?=
 =?utf-8?B?UTkxeXUyNHlqM0cwOC9aN2FmZXByRU1VVFFWZnZBNzVMSUZLYWRWQnUyR3Fp?=
 =?utf-8?B?c3ZSa2xvMmFKRFNXZG9TRzhheWVRS3FGWFVrM3NadGNJZWNxdHlEelFmbGJl?=
 =?utf-8?B?REszRUhXdzI0Z2kyOThmdW5la2pZd0FyTzAwSHpyYWRZUkVaa1l3Mm1aWklu?=
 =?utf-8?B?WnZ2eDJvRU5VK0RMOGoydEo3dkc2Zy9LRFBUZjVhTndKWEliOHRyaEJpOWVl?=
 =?utf-8?B?RmxLb2hSdkFxcEdIZVl2aGhsTVh3eElHTXpYczVvazhTUGMwYUNMb2RGR2tF?=
 =?utf-8?B?NTRJSEFKb09tTzJrT2U5L3ZOVXlLazg0ekxNZ01oTWM1TjJOeWhCR3YvdkN0?=
 =?utf-8?B?b2lmb2VtL21xVXBhSTZMTE1OZm8vWjZzOGg1UTFpbUdNT2t5TkZlVFJ1SDVL?=
 =?utf-8?B?QWc9PQ==?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6e73a95b-469d-440d-cab9-08db45073d45
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB5040.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Apr 2023 21:02:40.0495
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: O/umzu5VbOH/yz24fcOVoo27xtlsLR/WvceTHTFUS6zvSVfGMKL4mTo+aXpTMzw1hJteB6uYGrngBkf7If0Rsw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB7022
Subject: [virtio-comment] Re: [PATCH v12 02/10] admin: introduce device group and related
 concepts



On 24/04/2023 19:44, Michael S. Tsirkin wrote:
> Each device group has a type. For now, define one initial group type:
> 
> SR-IOV type - PCI SR-IOV virtual functions (VFs) of a given
> PCI SR-IOV physical function (PF). This group may contain zero or more
> virtio devices according to NumVFs configured.
> 
> Each device within a group has a unique identifier. This identifier
> is the group member identifier.
> 
> Note: one can argue both ways whether the new device group handling
> functionality (this and following patches) is closer
> to a new device type or a new transport type.
> 
> However, it's expected that we will add more features in the near
> future. To facilitate this as much as possible of the text is located in
> the new admin chapter.
> 
> Effort was made to minimize transport-specific text.
> 
> There's a bit of duplication with 0x1 repeated twice and
> no special section for group type identifiers.
> It seems ok to defer adding these until we have more group
> types.
> 
> Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
> Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>

Looks good,

Reviewed-by: Max Gurtovoy <mgurtovoy@nvidia.com>


> ---
> changes in v12:
> 	stefan's ack
> 	minor commit log tweaks, Parav
> 	use neutral tone, Parav
> 
> changes in v11:
> 	dropped Max's S.O.B.
> 	dropped an unmatched ) as reported by Parav
> 	document that member id is 1 to numvfs
> 	document that vf enable must be set (will also be reflected in
> 		the conformance section)
> 	document that we deferred generalizing text as requested by Parav -
> 	I think we can do it later
> 	minor wording fixes to address comments by David
> 	add concepts of owner and member driver. unused currently
> 	but will come in handy later, as suggested by Stefan
> ---
>   admin.tex   | 63 +++++++++++++++++++++++++++++++++++++++++++++++++++++
>   content.tex |  2 ++
>   2 files changed, 65 insertions(+)
>   create mode 100644 admin.tex
> 
> diff --git a/admin.tex b/admin.tex
> new file mode 100644
> index 0000000..05d506a
> --- /dev/null
> +++ b/admin.tex
> @@ -0,0 +1,63 @@
> +\section{Device groups}\label{sec:Basic Facilities of a Virtio Device / Device groups}
> +
> +It is occasionally useful to have a device control a group of
> +other devices. Terminology used in such cases:
> +
> +\begin{description}
> +\item[Device group]
> +        or just group, includes zero or more devices.
> +\item[Owner device]
> +        or owner, the device controlling the group.
> +\item[Member device]
> +        a device within a group. The owner device itself is not
> +	a member of the group.
> +\item[Member identifier]
> +        each member has this identifier, unique within the group
> +	and used to address it through the owner device.
> +\item[Group type identifier]
> +	specifies what kind of member devices there are in a
> +	group, how the member identifier is interpreted
> +	and what kind of control the owner has.
> +	A given owner can control multiple groups
> +	of different types but only a single group of a given type,
> +	thus the type and the owner together identify the group.
> +	\footnote{Even though some group types only support
> +			specific transports, group type identifiers
> +			are global rather than transport-specific -
> +			a flood of new group types is not expected.}
> +\end{description}
> +
> +\begin{note}
> +Each device only has a single driver, thus for the purposes of
> +this section, "the driver" is usually unambiguous and refers to
> +the driver of the owner device.  When there's ambiguity, "owner
> +driver" refers to the driver of the owner device, while "member
> +driver" refers to the driver of a member device.
> +\end{note}
> +
> +The following group types, and their identifiers, are currently specified:
> +\begin{description}
> +\item[SR-IOV group type (0x1)]
> +This device group has a PCI Single Root I/O Virtualization
> +(SR-IOV) physical function (PF) device as the owner and includes
> +all its SR-IOV virtual functions (VFs) as members (see
> +\hyperref[intro:PCIe]{[PCIe]}).
> +
> +The PF device itself is not a member of the group.
> +
> +The group type identifier for this group is 0x1.
> +
> +A member identifier for this group can have a value from 0x1 to
> +\field{NumVFs} as specified in the
> +SR-IOV Extended Capability of the owner device
> +and equals the SR-IOV VF number of the member device;
> +the group only exists when the \field{VF Enable} bit
> +in the SR-IOV Control Register within the
> +SR-IOV Extended Capability of the owner device is set
> +(see \hyperref[intro:PCIe]{[PCIe]}).
> +
> +Both owner and member devices for this group type use the Virtio
> +PCI transport (see \ref{sec:Virtio Transport Options / Virtio Over PCI Bus}).
> +\end{description}
> +
> +
> diff --git a/content.tex b/content.tex
> index 8098988..04592fb 100644
> --- a/content.tex
> +++ b/content.tex
> @@ -493,6 +493,8 @@ \section{Exporting Objects}\label{sec:Basic Facilities of a Virtio Device / Expo
>   types. It is RECOMMENDED that devices generate version 4
>   UUIDs as specified by \hyperref[intro:rfc4122]{[RFC4122]}.
>   
> +\input{admin.tex}
> +
>   \chapter{General Initialization And Device Operation}\label{sec:General Initialization And Device Operation}
>   
>   We start with an overview of device initialization, then expand on the

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

