Received: from NAM11-DM6-obe.outbound.protection.outlook.com (mail-dm6nam11on2062.outbound.protection.outlook.com [40.107.223.62])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5DB925C6F9
	for <virtio-comment@lists.linux.dev>; Mon, 10 Feb 2025 19:46:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.223.62
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739216820; cv=fail; b=pMMOoV3EnI7xrGbret1obHQpbyPutopW5uDLzHf6K+GpLgIpFhj9XAAE9msCjbhOzRsWVU+DKvpdRd1fvtP5fb9qNSlvQdDORN1EXKE9oX5xJ3OtBElH5WSEBw/Z1u8ueE/G//XfnTC3hU7nkkN1MUuMjFDcccHSdcq+HiQOzXQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739216820; c=relaxed/simple;
	bh=YZSymHHMHF891VgDY7yj8Pym97f7Q7Tuihc5vQAVI/E=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=kt5RCEZxp83JRUQJoZN0cz4qcVRxlJihlNmq/AQlzbrNPRverglXMrwm8cbLN7DPZ8eb6g1BrfG4BfiC1dBilOF9fkr5cFahESzPVrdVorLa82rIqHK7EvXuK+Gt7Da9NGjfjFB3N/rb7d/PSv7PR46iudSzHeKK9UjSJ0h5RoY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=nVSQCL7l; arc=fail smtp.client-ip=40.107.223.62
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="nVSQCL7l"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PGCeYWvnxRCMSMj7UxjH742Ct/VH06thE926I/Y4ecuaCdmCWg7gnfFbqMKAI3luT7cBBrIl2kJJqQNbIPgoqy1+5GHKv1dQHP2tqp7FL37/Szgg8c6l/1E67+q/ZlMcZkow0ksJSyCUqHvV5LQyDLQSjtbfsT8asKFgjLRGHfD8HWlRN+K7z5SWMv4SuORVRhH6TW6wVJuV8qgraSznI4h4eoqtYLh6Qm9TClzCAFcDmfgoT5DDF4ck26X/bXkDls/2w7TCejkIYAghambxJRITKTF39nNELQNOM7uJ+0btWD9RnxGYcw6qlsXHeoHm9vxLdv1AVwEmVpGsQkDWOg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ovf6nkKZmFZDM7C7Py9Y0MTtF3XDyuSMCZ8uDj3MaKk=;
 b=cSoRzVn5jKm9NU/GR8GB74NB4BXUa1jGwtVgtHNRNAszJ8EXuLme3YxfUUU5PL8Tzr4brMa393XjVlUom04DBanbCNaeVbbBrRFbMANKtf/RYY9iE2Kv6V/xxm+lwd6nltt5mPRIkIitWtkjzLAIwaHdhc9sl6nKaxoeYFpMZUTV5kbXIm5Bj6V733BW0yxgoABt4v2oEUUfbkKdDfq/HWkxUhbfXD/kyRZq4j65lPRQCzmEl9xtLaIO81A1kGAIKw2Td3Y7XyPj1ST7WIJn03iVhf47a9HXMCHT1bqd2/PkHNidPFrw3tvSyCljJgc6VtuZgJYMphkY9C0xDjGBtA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ovf6nkKZmFZDM7C7Py9Y0MTtF3XDyuSMCZ8uDj3MaKk=;
 b=nVSQCL7lI5XUN9tdfcAIxoEGdEYXfxTPKikdT8CKAi8lF1PV2c8gTrzrYTVfO7eqW79vANbezcCUjZcx+RW5IKKG//ctPDuHyWnOupeHUBEiasjtDnNf0iqgXhZVyf5Y5DYcSuIrKvuQznzKzBt3kIm4RfCLSVk11I8TtRH3Z4PiQX9p6KfSKZZsk+7LJKg3kpYWeGaqcQAEExemOHkUXsvOT6EvGHzkUEGQiSHX5ohk72B1bVwV87hCZws5nlcJ3vjbWL+ZMvdOeZ17FM2zDIdUORU3qs5RYou4N/yUuY2OF5y122PAwjupcTWROYuu8u8s6lzzcwp+c97OSQ0ObQ==
Received: from CY8PR12MB7195.namprd12.prod.outlook.com (2603:10b6:930:59::11)
 by IA1PR12MB6283.namprd12.prod.outlook.com (2603:10b6:208:3e5::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8422.16; Mon, 10 Feb
 2025 19:46:54 +0000
Received: from CY8PR12MB7195.namprd12.prod.outlook.com
 ([fe80::c06c:905a:63f8:9cd]) by CY8PR12MB7195.namprd12.prod.outlook.com
 ([fe80::c06c:905a:63f8:9cd%3]) with mapi id 15.20.8422.015; Mon, 10 Feb 2025
 19:46:53 +0000
From: Parav Pandit <parav@nvidia.com>
To: Srujana Challa <schalla@marvell.com>, "virtio-comment@lists.linux.dev"
	<virtio-comment@lists.linux.dev>
CC: "mst@redhat.com" <mst@redhat.com>, "cohuck@redhat.com"
	<cohuck@redhat.com>, "mvaralar@redhat.com" <mvaralar@redhat.com>,
	"sburla@marvell.com" <sburla@marvell.com>, "ndabilpuram@marvell.com"
	<ndabilpuram@marvell.com>, "jerinj@marvell.com" <jerinj@marvell.com>,
	"anoobj@marvell.com" <anoobj@marvell.com>
Subject: RE: [PATCH RFC v3 1/4] virtio-crypto: Add IPsec service operation and
 Capabilities
Thread-Topic: [PATCH RFC v3 1/4] virtio-crypto: Add IPsec service operation
 and Capabilities
Thread-Index: AQHbbJVFvVnlVDpqKU+VOF/OEL44XLNBBqGA
Date: Mon, 10 Feb 2025 19:46:53 +0000
Message-ID:
 <CY8PR12MB7195A39AD70B7A6034872B9ADCF22@CY8PR12MB7195.namprd12.prod.outlook.com>
References: <20250122061644.266560-1-schalla@marvell.com>
 <20250122061644.266560-2-schalla@marvell.com>
In-Reply-To: <20250122061644.266560-2-schalla@marvell.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CY8PR12MB7195:EE_|IA1PR12MB6283:EE_
x-ms-office365-filtering-correlation-id: 5feef81d-4112-414a-6a91-08dd4a0bab47
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|376014|366016|38070700018;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?1qFeXsoR+egVIVY8DBjTAmqtukhjewWB2QYw2vYuyKTNwGbQ6JkukMPH1AZf?=
 =?us-ascii?Q?zMLydZOUKfuk7o/NJSK0iJVJd6XqpeaSCCqcVFryC2Fs2RKuwK+Tl313D8TQ?=
 =?us-ascii?Q?/fAq54zel+cO8GDzuDG1Fjf9SjWXxcK8AwHZNL4NOwygd+I24TE0ejvRfx6t?=
 =?us-ascii?Q?A0s3+LLezHyS+IuyScxCh1S4puMk4VmMsjRUB1N2PgTEAVcSRhNqGd2r946k?=
 =?us-ascii?Q?9W22D6DUqLjmFu6x2UlOKtZMK5j3Rtj4Y0DaEsHdqI00jPw7vQuj2W09I2wP?=
 =?us-ascii?Q?shf71h69jifwTzqnGwoHpCrtKzxSRKFWnFD9SXYS61t+x/dQKSeZpBBf158d?=
 =?us-ascii?Q?hkxeOLOZtJfGthcf1Zon7qotX9TeK4q1wOIDPEmQ5FSgpfx30hcOgDZpfFTJ?=
 =?us-ascii?Q?rUt99f5Kb/qCydriQBr/beQX9PTRSKwcw8rQVEACEFYcfSuTjaaUt3geYLDo?=
 =?us-ascii?Q?beM4+7Hln3IAE9gam3eTlYRV+xsUtYzaYxvVwoUECO80ArATE72HqCVRU+mf?=
 =?us-ascii?Q?EZTuyAg1fI8iDpKw2dvqKIGgKE64N4waKSE/thXTKkzIFYMSD1hwPaqD3Qso?=
 =?us-ascii?Q?R95NulkU2CtY1YVeLlHCD2s+pEr2vx8k4dZKYFEHjU2HNrGI46cBs6+5OrPv?=
 =?us-ascii?Q?zgQ18ejAwFWYPorRwLWSC5/GuvCTIVLzk2HhNE3cmiNk7yXT6750fszO8dtz?=
 =?us-ascii?Q?mVKkU7+1prt33jbV++RP0Tp+NhAuEqHJ0fUZ6pQlNrX4FZjA+Gn6EOatMrHN?=
 =?us-ascii?Q?C/1SMjsKJmW2i+6bUuAJbscvwBC5LMnSrjUDhWM8d9s5Yqp9I1QQI1ZDuytk?=
 =?us-ascii?Q?ySD8GUZh69P+kwBK8xOS7YFPuY24YB8jOqMxygFmG3uHkfQwDHbabYbGY0sv?=
 =?us-ascii?Q?Mz0APh+niKAtYbR53xGJq9gYDNvNe1pID1JvrG09XCOeos04QcYPXFt6bDMw?=
 =?us-ascii?Q?8g8NpuLCQXYwlDjpeT45/LTHxA+B3OcGvlmxJJzysMvwqFl1jDHJahzLX6hc?=
 =?us-ascii?Q?k7t/3jYncikqhcPtWkT0cOR5eNulPjnKqaCmYvfhvDei2S1w/dyvlE/TQIIA?=
 =?us-ascii?Q?DpkCFgVAxECvGaeJuNx3e4F9NRNn65dakVrbYe67fRgg/+nPp+wehYzFjCBo?=
 =?us-ascii?Q?CUAA9aeCf99m3h9bssqIoFI9bl3K6/E/TsuFAhWHGXkadEy0bguLWGH5ENoB?=
 =?us-ascii?Q?VkoO/0OTHPle9GtxUE1lH2ZaO1UUV8BaxhEjMP5ImPEpLzY9p3eNXEkJ/Dy9?=
 =?us-ascii?Q?SM/NNwzHIliBlrs7HRNUCdBzAEXsAZ0JnHE+Tkp6sZ4P5li+Y7u9vPXHcR00?=
 =?us-ascii?Q?V647QlMj/IQF+5K0Jh0egk2Zgkn9qFEcfqmNGWsh+UX613g4GeFO646INCzp?=
 =?us-ascii?Q?8vcojxNy8fxFCTrQWgC6aOEjt4WllRca+1DGHW07UwF58eEN4E9Ayqpx3t25?=
 =?us-ascii?Q?BJqxDSw5SZe+39KHcv4j7N5rTLQa8Ptl?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY8PR12MB7195.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?okoaSMq5QDajb3+ILc8lfkFt9Eav5bKIoYBsXjbPpD6hYZPNcX4nbZ/O15AS?=
 =?us-ascii?Q?OvPwnMRYlXSmzcyxy/cpMaol7wcNFmMroN0kTwiDBsdIbtNympcuXib5Q2+Y?=
 =?us-ascii?Q?ZqEFUJW/2VWDoYVzsU3IsGvAyUY9HEg6g/iFieMhWKdzFQZGG9vCWsR2dGXV?=
 =?us-ascii?Q?hWQ2lAoJqsK3Zn6eH8AwP/2JbGU9Hs/4qqAiq8TWy43dVgx8x4CELYS5qca+?=
 =?us-ascii?Q?v6WorvaYgWpCy5ms6s0CHx45h+GS3iGnLOA94GJKcZUrlJXmfVav2fJ5YFu5?=
 =?us-ascii?Q?7F98eRaW+uekHlm+ccmRga59UdJRtcUVYWfN7Dyz5DUfrrGk3W/hSQaXnE2Z?=
 =?us-ascii?Q?rJISIp9MX0YqybmgDQF2opHXRGYoekGmrlALRUVkoqQP2i3AWkv9eDzMfbGb?=
 =?us-ascii?Q?26FFsFMWo4aroSudU2wa/UVL1FEbi/LqNxQTHpZdmFpIsufRX2fk1xODH7Br?=
 =?us-ascii?Q?kCJWCyB4V6do8x7HLI0nYqdOQU8ByxDnRZqzmkhyu6GzYQeHsA30CDoNuBjk?=
 =?us-ascii?Q?gGRWm1xA8p0VgX0X/w5ZzkfBb5D9wttLzPJZF4lBVlE3ZSfhCX28676IE1Q5?=
 =?us-ascii?Q?RHECIIQ7wzzFPgv/jVtN+A04w36JwuRLWIECH1Eiukd5cC0uBq2BjYaTi+C1?=
 =?us-ascii?Q?tOUFx9xadslmW9eTmBlNB5ehWYb0zY/Ms0wLpsqG324EI+xFhz8qUK4R+m36?=
 =?us-ascii?Q?Gv7YmFDWtlPWjHTHMMw+6wGrVI9JvjTHYtsSqC9EVfK4OblkhVjcYT0JUn4Z?=
 =?us-ascii?Q?C9RUPqwrYqchLPYjM1P0hTJCO1tZX8KegUvl/UxWS2FdSrboyq0jI/TnEQMD?=
 =?us-ascii?Q?x1z976epjsQp+Lj8/sp4GGTD0Bol4UF9v5rKasyUOKqovrU/AvcwqXn/f3Qw?=
 =?us-ascii?Q?SJi7xKDzkr/jYKfcURW/eFL7I8AZO3byS19zVKCd891rKocX4IxaMM7t3U2d?=
 =?us-ascii?Q?9Qpo9/U9XRQulBC+LrbzmPUK7TtQ0ieWAxUWNWI2rltbNiWjBvPTwSTwNwYm?=
 =?us-ascii?Q?HFRcB5tJ0adx/xgZlfCyvNj2WReQSGj/ek/j9Ay8O5DZLII0JC7xLudvndP/?=
 =?us-ascii?Q?RqysbAsLpv+9JU/TvYMHIO1JlX0OWkA4SbyWp3w3m2E+Nrvj3BDPjU7ZcTD5?=
 =?us-ascii?Q?yc0gtiarUxxVa3xPNVLViwCkOSbesJx9MuZCF/9obQtxCh46d/cHys4ZZ/iP?=
 =?us-ascii?Q?pmSDH11J/lYhH+j21olETdmnRY1ed8Na1hfzZcImXbFFr54Tz5/eWpbKTgDD?=
 =?us-ascii?Q?ymI7fo2nbJ0lqvKIjQupxyEHMdDM/2V8aj9mMkb8C75NdDAblmz97AdIpkuN?=
 =?us-ascii?Q?GKLmMRAolXUTBBc7RjuHoqGZ7j6J0tFMTvboQ2PIszjS+KrpFWmaw0ErsFsi?=
 =?us-ascii?Q?7A6XLW1BB9AXrKDLUDqcK74lQxXInDIl+UUqW7z1WpnpflUBbDtm3dfuXo6S?=
 =?us-ascii?Q?eCWS80LWgIIxKWKFhJdY5c6mBwvee2wgKoLwsK3ZxE6gdUgzykTnHG9Pjryc?=
 =?us-ascii?Q?Quu0h0qls9GBb8ur+mSMgQW+4VX1uV1QLc2I8Qk7W21awG1kR6qtIwmfYK79?=
 =?us-ascii?Q?PI6974cCGSc5TF9ZLUk=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CY8PR12MB7195.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5feef81d-4112-414a-6a91-08dd4a0bab47
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Feb 2025 19:46:53.4749
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 9GKIV+zu6W3MRY3ZHsckZUDnIcddTTw2gFsEQZ5lJraS0oztDsyfzPZdHB5+bF/p1xbS+SgUf6VPk08dVqdMSg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB6283



> From: Srujana Challa <schalla@marvell.com>
> Sent: Wednesday, January 22, 2025 11:47 AM
>=20
> This commit introduces the IPsec service operation to the Crypto device,
> enabling offloading of IPsec processing.
>=20
> Capabilities:
>=20
> 1. IPsec Resource Capability (VIRTIO_CRYPTO_IPSEC_RESOURCE_CAP):
>    Indicates the device's IPsec resource limits, such as the number of
>    outbound and inbound Security Associations (SAs).
> 2. IPsec SA Capability (VIRTIO_CRYPTO_IPSEC_SA_CAP): Specifies the
>    supported IPsec modes, along with the supported cryptographic
>    algorithms, authentication algorithms, IPsec options and
>    anti-replay window size.
>=20
> Signed-off-by: Srujana Challa <schalla@marvell.com>
> ---
>  device-types/crypto/description.tex | 166 +++++++++++++++++++++++++++-
>  introduction.tex                    |  12 ++
>  2 files changed, 173 insertions(+), 5 deletions(-)
>=20
> diff --git a/device-types/crypto/description.tex b/device-
> types/crypto/description.tex
> index 5705e26..2c00e50 100644
> --- a/device-types/crypto/description.tex
> +++ b/device-types/crypto/description.tex
> @@ -2,13 +2,15 @@ \section{Crypto Device}\label{sec:Device Types / Crypto
> Device}
>=20
>  The virtio crypto device is a virtual cryptography device as well as a  =
virtual
> cryptographic accelerator. The virtio crypto device provides the -followi=
ng
> crypto services: CIPHER, MAC, HASH, AEAD and AKCIPHER. Virtio crypto -
> devices have a single control queue and at least one data queue. Crypto -
> operation requests are placed into a data queue, and serviced by the -dev=
ice.
> Some crypto operation requests are only valid in the context of a -sessio=
n.
> The role of the control queue is facilitating control operation
> +following crypto services: CIPHER, MAC, HASH, AEAD, AKCIPHER and IPSEC.
> +Virtio crypto devices have a single control queue and at least one data
> +queue. Crypto operation requests are placed into a data queue, and
> +serviced by the device. Some crypto operation requests are only valid
> +in the context of a session. The role of the control queue is
> +facilitating control operation
>  requests. Sessions management is realized with control operation  reques=
ts.
> +The crypto device may have administration command interface through
> +which IPsec service capabilities and resources are configured.
>=20
>  \subsection{Device ID}\label{sec:Device Types / Crypto Device / Device I=
D}
>=20
> @@ -72,6 +74,8 @@ \subsection{Supported crypto services}\label{sec:Device
> Types / Crypto Device /
>  #define VIRTIO_CRYPTO_SERVICE_AEAD   3
>  /* AKCIPHER (Asymmetric Key Cipher) service */  #define
> VIRTIO_CRYPTO_SERVICE_AKCIPHER 4
> +/* IPSEC service */
> +#define VIRTIO_CRYPTO_SERVICE_IPSEC  5
>  \end{lstlisting}
>=20
>  The above constants designate bits used to indicate the which of crypto
> services are @@ -318,6 +322,20 @@ \subsection{Device
> Initialization}\label{sec:Device Types / Crypto Device / Devi  \item The =
driver
> MUST read the supported algorithms based on \field{crypto_services} field=
.
>  \end{itemize*}
>=20
> +\subsection{Device and driver capabilities}\label{sec:Device Types /
> +Crypto Device / Device and driver capabilities}
> +
> +The crypto device has the following capabilities.
> +
> +\begin{tabularx}{\textwidth}{ |l||l|X| } \hline Identifier & Name &
> +Description \\ \hline \hline
> +0x0800 & \hyperref[par:Device Types / Crypto Device / Device Operation
> +/ IPsec Service Operation / Device and driver capabilities /
> +VIRTIO-CRYPTO-IPSEC-RESOURCE-
> CAP]{VIRTIO_CRYPTO_IPSEC_RESOURCE_CAP} &
> +IPsec resource capability \\ \hline
> +0x0801 & \hyperref[par:Device Types / Crypto Device / Device Operation
> +/ IPsec Service Operation / Device and driver capabilities /
> +VIRTIO-CRYPTO-IPSEC-SA-CAP]{VIRTIO_CRYPTO_IPSEC_SA_CAP} & IPsec
> +Security Association(SA) capability \\ \hline \end{tabularx}
> +
>  \subsection{Device Operation}\label{sec:Device Types / Crypto Device /
> Device Operation}
>=20
>  The operation of a virtio crypto device is driven by requests placed on =
the
> virtqueues.
> @@ -1872,3 +1890,141 @@ \subsubsection{AKCIPHER Service
> Operation}\label{sec:Device Types / Crypto Devic  \item VIRTIO_CRYPTO_ERR
> if any failure not mentioned above occurs.
>  \end{itemize*}
>  \end{itemize*}
> +
> +\subsubsection{IPSEC Service Operation}\label{sec:Device Types / Crypto
> +Device / Device Operation / IPSEC Service Operation}
> +
> +A crypto device can support the processing of IPsec protocol operations.
> +In addition to standard crypto processing, the IPsec protocol
> +operations are also handled by the Crypto Device as a lookaside operatio=
n.
> +
s/Crypto Device/crypto device/

> +IPsec Inbound processing: The device will perform decryption,
> +authentication, integrity checking and remove additional headers,
> +including tunnel header if in tunnel mode, as well as the ESP/AH header =
from
> the packet(See \hyperref[intro:IPSEC]{IPSEC} RFC).
> +The resulting packet contains only the plain data.
> +
> +IPsec Outbound processing: The device will perform encryption, attach
> +ICV, update/add IP header, add ESP/AH header/trailer.
> +
> +A crypto device can support number of IPsec SAs, allowing it to manage
> +multiple secure connections simultaneously.
> +
> +The device and the driver indicate IPsec SA resource limits using the
> +VIRTIO_CRYPTO_IPSEC_RESOURCE_CAP capability specifying the limits on
> +the number of IPsec outbound and inbound SA resource objects.
> +The VIRTIO_CRYPTO_IPSEC_SA_CAP capability  specifies which IPsec
> +protocol capabilities the device supports. The driver indicates the
> +IPsec parameters by setting the IPsec SA capability prior to adding any
> resource object.
> +
> +The driver controls the IPsec SA resource object using administration
> +commands described in \ref{sec:Basic Facilities of a Virtio Device / Dev=
ice
> groups / Group administration commands / Device resource objects}.
> +
> +\paragraph{Device and driver capabilities} \label{par:Device Types /
> +Crypto Device / Device Operation / IPsec Service Operation / Device and
> +driver capabilities}
> +
> +\subparagraph{VIRTIO_CRYPTO_IPSEC_RESOURCE_CAP}
> +\label{par:Device Types / Crypto Device / Device Operation / IPsec
> +Service Operation / Device and driver capabilities /
> +VIRTIO-CRYPTO-IPSEC-RESOURCE-CAP}
> +
> +The VIRTIO_CRYPTO_IPSEC_RESOURCE_CAP capability indicates the IPsec SA
> resource limits.
> +\field{cap_specific_data} is in the format \field{struct
> +virtio_crypto_ipsec_resource_cap}.
> +
> +\begin{lstlisting}
> +struct virtio_crypto_ipsec_resource_cap {
> +        le32 inb_sa_limit;
> +        le32 outb_sa_limit;
> +};
> +\end{lstlisting}
> +
> +\field{inb_sa_limit}, and \field{outb_sa_limit} denote the maximum
> +number of IPsec security Associations (SAs) that can be utilized for
> +IPsec inbound and outbound processing, respectively, which the device is
> capable of creating.
> +
> +\subparagraph{VIRTIO_CRYPTO_IPSEC_SA_CAP}
> +\label{par:Device Types / Crypto Device / Device Operation / IPsec
> +Service Operation / Device and driver capabilities /
> +VIRTIO-CRYPTO-IPSEC-SA-CAP}
> +
> +The VIRTIO_CRYPTO_IPSEC_SA_CAP capability lists the supported IPsec
> +modes along with the supported cryptographic, authentication algorithms
> +and anti-replay window size for each IPsec mode.
> +\field{cap_specific_data} is in the format \field{struct
> virtio_crypto_ipsec_sa_cap_data}.
> +
> +\begin{lstlisting}[label=3D{lst:Device Types / Crypto Device / Device
> +Operation / IPsec Service Operation / Device and driver capabilities / V=
IRTIO-
> CRYPTO-IPSEC-SA-CAP / virtio-crypto-ipsec-mode-cap}] struct
> virtio_crypto_ipsec_mode_cap {
> +        u8 mode;
> +        u8 reserved[3];
> +        le32 max_replay_win_sz;
> +        le32 options;
Please add le32 reserved for 64-bit natural alignment.

> +        le64 cipher_algo;
> +        le64 hmac_algo;
> +        le32 aead_algo;
> +        le32 max_cipher_key_len;
> +        le32 max_auth_key_len;
> +};
> +
> +struct virtio_crypto_ipsec_sa_cap_data {
> +        u8 count;
> +        u8 reserved[7];
> +        struct virtio_crypto_ipsec_mode_cap mode[]; }; \end{lstlisting}
> +
Better to name this 'mode' or as 'cap_mode'.

> +\field{count} indicates number of valid entries in the \field{mode} arra=
y.
> +\field{mode[]} is an array of supported IPsec modes. Within each array e=
ntry:
> +
> +\field{mode} specifies the IPsec mode, as defined in table
> +\ref{table:Device Types / Crypto Device / Device Operation / IPsec Servi=
ce
> Operation / Device and driver capabilities / VIRTIO-CRYPTO-IPSEC-SA-CAP /
> IPsec Modes}.
> +\field{max_replay_win_sz} specifies the maximum anti-replay window size
> the device supports.
> +This field is applicable only for inbound operation.
> +
> +\field{options} Each bit indicates the IPsec protocol options supported
> +by the device, as defined in table \ref{table:Device Types / Crypto Devi=
ce /
> Device Operation / IPsec Service Operation / Device and driver capabiliti=
es /
> VIRTIO-CRYPTO-IPSEC-SA-CAP / IPsec Options}.
> +
> +\field{cipher_algo} CIPHER algorithms mask, see \ref{sec:Device Types /
> Crypto Device / Supported crypto services  / CIPHER services}.
> +
> +\field{hmac_algo} HMAC algorithms mask, see \ref{sec:Device Types / Cryp=
to
> Device / Supported crypto services  / MAC services}.
> +
> +\field{aead_algo} AEAD algorithms mask, see \ref{sec:Device Types / Cryp=
to
> Device / Supported crypto services  / AEAD services}.
> +
> +\field{max_cipher_key_len} is the maximum length of cipher key supported
> by the device.
> +
> +\field{max_auth_key_len} is the maximum length of authenticated key
> supported by the device.
> +
Authenticated or authentication?
